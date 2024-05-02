# Dotfiles

## Objectif

L'objectif de ce dépôt est de faciliter la mise en place rapide et la synchronisation des environnements de développement sur plusieurs machines. Il permet également une personnalisation et une gestion facile des configurations système courantes.

## Structure du dépôt

Le dépôt est organisé comme suit :

- `commons/` : Configurations communes pour tous les environments.
- `mac/` : Configurations pour MacOs.
- `ubuntu/` : Configurations pour Ubuntu/WSL.

## Comment utiliser ce dépôt

Pour utiliser ce dépôt, clonez-le sur votre machine locale, puis suivez les instructions spécifiques à chaque dossier pour configurer les logiciels concernés.

### Cloner le dépôt

```bash
git clone git@github.com:thomas-leroy/dotfiles.git
cd dotfiles
```

### Installation

Pour lancer l'installation :

```bash
make install
```

Une fois le script terminé, il est recommandé de quitter et ouvrir une nouvelle session de terminal.

### Initialisation de l’environnement de dev

Pour initialiser git et node, lancer la commande suivante :

```bash
make init
```

### Mettre à jour le repo

```bash
make update
```

### Sauvegarder la configuration de Visual Studio Code

```bash
make export-vscode
```

Les raccourcis, paramétrages et extension installée seront sauvegardées dans le répertoire `./vscode/ressources`.

L'ensemble des paramètres peut être importé en utilisant la commande :

```bash
make import-vscode
```

## Personnalisation

Vous êtes encouragé à fork ce dépôt et à modifier les configurations selon vos besoins. Vous pouvez également contribuer à ce dépôt en proposant des améliorations ou de nouvelles configurations.

## Licence

Ce dépôt est distribué sous la licence MIT. Vous êtes libre de l'utiliser, le modifier et le redistribuer selon les termes de cette licence.

## Contribution

Les contributions à ce dépôt sont les bienvenues. Si vous souhaitez améliorer ou ajouter de nouvelles configurations, veuillez soumettre une pull request.

## Support

Si vous avez des questions ou rencontrez des problèmes avec ce dépôt, veuillez ouvrir une issue dans ce dépôt GitHub.
