## Login with apple ID first
# TODO: add to readme


# Run Apple Updates First
softwareupdate --all --install --force

## Setup The Big Stuff

mkdir ~/.ssh || true;
touch ~/.zshrc || true;

# Fix the scroll direction..
defaults write -g com.apple.swipescrolldirection -bool FALSE

# Install Brew and turn analytics off
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew analytics off

# Quality of life stuff
brew install iterm2
# TODO: Install iTerm Profile

# Install Coding Tools
brew cask install jetbrains-toolbox
brew cask install visual-studio-code
brew install cocoapods
brew install fastlane

brew tap dart-lang/dart
brew install dart
pub global activate fvm
echo 'export PATH="$PATH":"$HOME/.pub-cache/bin"' >> ~/.zshrc


# Misc Installs
