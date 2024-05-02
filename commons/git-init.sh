#!/bin/bash

echo "INIT : Initialisation de l'environnement git"

# Demande à l'utilisateur de saisir ses informations
read -p "Entrez votre adresse email : " email
read -p "Entrez votre nom complet : " fullname
read -p "Entrez l'ID de votre clé GPG (si disponible, sinon une nouvelle sera créée) : " gpgkeyid

# Configuration de Git avec les informations saisies
git config --global user.email "${email}"
git config --global user.name "${fullname}"

if [[ -z "$gpgkeyid" ]]; then
    # Création d'une nouvelle clé GPG si aucune n'est fournie
    echo "Aucune clé GPG fournie. Création d'une nouvelle clé GPG..."
    gpg --batch --full-generate-key <<EOF
Key-Type: RSA
Key-Length: 4096
Subkey-Type: RSA
Subkey-Length: 4096
Name-Real: ${fullname}
Name-Email: ${email}
Expire-Date: 0
EOF

    # Récupération de l'ID de la clé GPG nouvellement créée
    gpgkeyid=$(gpg --list-secret-keys --keyid-format LONG | grep sec | awk '{print $2}' | cut -d'/' -f2)
    echo "Nouvelle clé GPG créée avec l'ID: $gpgkeyid"
fi

# Configuration de la clé GPG dans Git
git config --global user.signingkey "${gpgkeyid}"
git config --global commit.gpgsign true

git config --global core.pager "less"
git config --global core.excludesfile ~/.gitignore

# Création d'une nouvelle clé SSH, avec l'email comme label
echo "Création d'une clé SSH pour ${email}..."
ssh-keygen -t rsa -b 4096 -C "${email}" -f ~/.ssh/id_rsa -N ""

# Démarrage de ssh-agent et ajout de la clé à ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Affichage de la clé publique SSH, prête à être copiée sur GitHub
echo "Copiez la clé publique SSH ci-dessous pour l'ajouter à votre compte GitHub:"
cat ~/.ssh/id_rsa.pub

# Affichage de la clé publique GPG, prête à être copiée sur GitHub
echo "Copiez la clé publique GPG ci-dessous pour l'ajouter à votre compte GitHub:"
gpg --armor --export "${gpgkeyid}"

echo "Configuration de Git terminée !"
