# Dotfiles

## Objective

The goal of this repository is to facilitate the rapid setup and synchronization of development environments across multiple machines. It also allows customization and easy management of common system configurations.

## Deposit structure

The deposit is organized as follows:

- `commons/`: Common configurations for all environments.
- `mac/`: Configurations for MacOs.
- `ubuntu/`: Configurations for Ubuntu/WSL.

## How to use this repository

To use this repository, clone it to your local machine, then follow the instructions specific to each folder to configure the relevant software.

The only dependency is git.

### Clone the repository

```bash
git clone git@github.com:thomas-leroy/dotfiles.git
cd dotfiles
```

### Facility

To start the installation:

```bash
make install
```

Once the script is finished, it is recommended to exit and open a new terminal session.

### Initializing the dev environment

To initialize git and node, run the following command:

```bash
make init
```

### Update repo

```bash
make update
```

### Save Visual Studio Code configuration

```bash
make export-vscode
```

The shortcuts, settings and installed extension will be saved in the `./vscode/ressources` directory.

All parameters can be imported using the command:

```bash
make import-vscode
```

## Known limitations

Windows Powershell code not supported yet.

Still room for improvement in error management.

## Personalization

You are encouraged to fork this repository and modify the configurations as needed. You can also contribute to this repository by proposing improvements or new configurations.

## Licence

This repository is distributed under the MIT License. You are free to use, modify and redistribute it under the terms of this license.

## Contribution

Contributions to this repository are welcome. If you want to improve or add new configurations, please submit a pull request.

## Support

If you have any questions or encounter issues with this repository, please open an issue in this GitHub repository.