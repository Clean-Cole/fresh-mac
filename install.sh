## Login with apple ID first
# TODO: add to readme

# Remove stuff we don't want
sudo rm -rf /Applications/GarageBand.app
sudo rm -rf /Applications/iMovie.app

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


##### Install Coding Tools
brew cask install jetbrains-toolbox
brew cask install visual-studio-code
brew install cocoapods
brew install fastlane

# Dart && Flutter Version Manager
brew tap dart-lang/dart
brew install dart
pub global activate fvm
echo 'export PATH="$PATH":"$HOME/.pub-cache/bin"' >> ~/.zshrc

# Python Version Manager
brew install pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc


# Node Version Manager
brew install nvm
mkdir ~/.nvm || true;
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm' >> ~/.zshrc
echo '  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion' >> ~/.zshrc

##### Common and Misc Installs
brew install iterm2
# TODO: Install iTerm Profile
brew cask install sizeup
brew cask install cleanmymac
brew cask install mailplane
brew cask install synergy
brew cask install 1password
brew cask install 1password-cli
brew cask install discord
brew cask install miro
brew cask install abstract
brew cask install postman
brew cask install sequel-pro
brew install wp-cli
brew cask install skitch
brew cask install spotify
brew cask install cyberduck
brew tap homebrew/cask-drivers
brew cask install logitech-options
brew cask install slack

# This is part of pyenv and has to be put at the end of the profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# Starship makes ther terminal look cool
brew install starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc # this has to be very very last


# Open Things That Need Attention or Logins
open /Applications/Docker.app # need to open this symlink some docker stuff
