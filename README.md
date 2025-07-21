# Dotfiles

![Commit Activity](https://img.shields.io/github/commit-activity/m/thomas-leroy/dotfiles)
![License](https://img.shields.io/github/license/thomas-leroy/dotfiles)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/6a363d98c12c4145a3a731baa8b6e34b)](https://app.codacy.com/gh/thomas-leroy/dotfiles/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

<p align="center">
  <img src="https://github.com/thomas-leroy/dotfiles/blob/main/assets/logo.png" alt="Dotfiles Logo" style="display:block;margin:auto;width:400px;height:400px;object-fit:contain;">
</p>

## Objective

The goal of this repository is to facilitate the rapid setup and synchronization of development environments across multiple machines for web development. It also allows customization and easy management of common system configurations.

You can gather some bash scripts to facilitate the setup of your dev environment.

You can also use my [VS Code extension list](vscode/resources/features.md), so your code editor is closer to a "real" IDE.

## Repository structure

The repository is organized as follows:

- `commons/`: Common configurations for all environments.
- `mac/`: Configurations for MacOs.
- `ubuntu/`: Configurations for Ubuntu/WSL.
- `windows/`: Configurations for Windows (Powershell).
- `vscode/` : Code and resources to import and export configuration for Visual Studio Code

## How to use this repository

### Requirement

To use this repository, clone it to your local machine, then follow the instructions specific to each folder to configure the relevant software.

The only dependency is `git`.

### Clone the repository

```bash
git clone git@github.com:thomas-leroy/dotfiles.git
cd dotfiles
```

### Facility

#### For Windows only

Use this command in **Elevated rights** PowerShell from the repository folder:

```powershell
.\windows\install.ps1
```

Once done and once you've installed your distribution on wsl, you can **clone back this project on WSL and follow the next sections**.

### Step 1 : Installation

To start the installation:

```bash
make install
```

This will install different tools depending the environnement :

| Ubuntu / Fedora         | Mac                     |
|-------------------------|-------------------------|
| -                       | Warp terminal           |
| -                       | Homebrew                |
| Zsh & Oh My Zsh         | Zsh & Oh My Zsh         |
| Theme (Powerlevel10k)   | Theme (Powerlevel10k)   |
| node.js (via nvm)       | node.js (via nvm)       |
| Docker & Docker Compose | Docker & Docker Compose |
| Visual Studio Code      | Visual Studio Code      |

**For Mac Users only:** This script will install preferences for MacOs. [More details on preference Mac Os.](mac/preferences-mac.md)

Once the script is finished, **it is needed to exit and open a new terminal session**.

### Step 2 : Initializing the dev environment

To initialize git and node, run the following command:

```bash
make init
```

This script will init git env by:

- Setting up your git email address & name globally
- [OPTIONAL] Generate GPG key
- Setting up your git GPG key globally
- Generating a new SSH key
- Display SSH public key and GPG public key to add it to your [Github configuration](https://github.com/settings/keys)

Next, your node environnement will be setup:

- Setting up directories to work on
- Update node.js
- Install [http-server](https://www.npmjs.com/package/http-server) globally

### Step 3 : Import Visual Studio Code configuration

All parameters can be imported using the command:

```bash
make import-vscode
```

This command will:

- Install the list of extensions on top of existing extensions (if any)
- Restore `settings.json`
- Restore `keybindings.json`

### [OPTIONAL] Save Visual Studio Code configuration

```bash
make export-vscode
```

This command will save you Visual Studio Code configuration:

- List of installed extensions
- `settings.json`
- `keybindings.json`

The shortcuts, settings and installed extension will be saved in the `./vscode/resources` directory.

## Known limitations

List of issues that will be handled soon:

- WSL import of Visual Studio Code is not working yet for shortcut & keybindings.
- Still room for improvement in error management.
- Working on code quality
- Needs full testing on fresh installations

## Personalization

You are encouraged to fork this repository and modify the configurations as needed.

## License

This repository is distributed under the MIT License. You are free to use, modify and redistribute it under the terms of this license.

## Contribution

Contributions to this repository are welcome. If you want to improve or add new configurations, please submit a pull request.

## Support

If you have any questions or encounter issues with this repository, please open an issue in this GitHub repository.
