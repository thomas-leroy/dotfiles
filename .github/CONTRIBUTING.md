# Contributing to Dotfiles

We are thrilled that you are interested in contributing to our project! This document provides guidelines and instructions on how to contribute to the project. Please take a moment to read this to make the contribution process easy and effective for everyone involved.

## How to Contribute

Contributing to our project is easy! You can contribute in different ways:

- Submitting bug reports or feature requests in the [Issue Tracker](https://github.com/thomas-leroy/dotfiles/issues).
- Contributing to the codebase or documentation.

### Getting Started

1. Make sure you have a [GitHub account](https://github.com/signup/free).
2. Fork the repository on GitHub.
3. Clone your fork to your local machine:
4. Create a new branch to hold your development changes:

### Making Changes

1. Always create a new branch for your changes. Do not work on the main branch.
2. Make your changes in a clear and concise manner. Make sure to test your changes.
3. Commit your changes using the commit message conventions (see below).
4. Push your changes to your fork on GitHub.
5. Submit a pull request to the original repository.

## Commit Message Guidelines

This project follows the AngularJS commit message conventions. This leads to **more readable messages** that are easy to follow when looking through the project history.

### Format of the Commit Message

```xml
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

### Example Commit

```text
feat(login): add the remember me checkbox

Add a "Remember Me" checkbox to the login form that saves the user's session. This is controlled by a new environment variable `REMEMBER_ME_ENABLED`, defaulting to false.

Fixes #123
```

### Type

Must be one of the following:

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, etc.)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests
- **chore**: Changes to the build process or auxiliary tools and libraries such as documentation generation

## Pull Request Process

1. Ensure any install or build dependencies are removed before the end of the layer when doing a build.
2. Update the README.md with details of changes to the interface, this includes new environment variables, exposed ports, useful file locations, and container parameters.
3. Increase the version numbers in any examples files and the README.md to the new version that this Pull Request would represent.
4. You may merge the Pull Request in once you have the sign-off of two other developers, or if you do not have permission to do that, you may request the second reviewer to merge it for you.

## Questions?

Feel free to contact the project maintainers if you have any questions or difficulties with the contributing process. Thank you for your contributions!
