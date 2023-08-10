#!/bin/zsh

## OH MY ZSH ###########
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## HOMEBREW ############
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

## PYTHON ##############

# Install Poetry
curl -sSL https://install.python-poetry.org | python3 -
poetry --version

mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh >$ZSH_CUSTOM/plugins/poetry/_poetry

brew install pyenv
brew install pyenv-virtualenv

### MANUAL DEPENDENCEIES #########
brew install node
