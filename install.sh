# Remove stuff we don't want
sudo rm -rf /Applications/GarageBand.app
sudo rm -rf /Applications/iMovie.app

# Run apple updates
softwareupdate --all --install --force

# Change to dark mode
defaults write -g AppleInterfaceStyle Dark

# Fix the scroll direction to not be like a phone (shudders)
defaults write -g com.apple.swipescrolldirection -bool FALSE

# create required folders and files
mkdir ~/.ssh || true;
touch ~/.zshrc || true;
mkdir ~/code || true;

# Install Brew and turn analytics off
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew analytics off

##### Install Coding Tools

git config --global user.email "cole@imakethe.com"
git config --global user.name "Cole Stevenson"

brew install --cask jetbrains-toolbox
brew install --cask visual-studio-code
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

# Install Go Version Manager
brew install mercurial
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
echo 'source ~/.gvm/scripts/gvm' >> ~/.zshrc
gvm listall

# Node Version Manager
brew install nvm
mkdir ~/.nvm || true;
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm' >> ~/.zshrc
echo '  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion' >> ~/.zshrc

# .NET SDK for Mac
brew install --cask dotnet-sdk

##### Common and Misc Installs
brew install iterm2
# TODO: Install iTerm Profile
brew install --cask sizeup
brew install --cask setapp
brew install --cask cleanmymac
brew install --cask 1password
brew install --cask 1password-cli
brew install --cask discord
brew install --cask miro
brew install --cask postman
brew install --cask skitch
brew install --cask spotify
brew install --cask cyberduck
brew tap homebrew/cask-drivers
brew install --cask logitech-options
brew install --cask docker
brew install awscli

# This is part of pyenv and has to be put at the end of the profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# Starship makes ther terminal look cool
brew install starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc # this has to be very very last

# Aerial is a crazy cool screensaver
brew cask install aerial

# Open Things That Need Attention or Logins
open /Applications/Docker.app # need to open this symlink some docker stuff

echo "Now restart this computer for everything to take effect."
