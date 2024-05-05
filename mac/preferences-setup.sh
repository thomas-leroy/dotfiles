#!/bin/bash

# Define color codes
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting macOS configuration...${NC}"

# Disable the sound effects on boot
echo -e "${YELLOW}Disabling the sound effects on boot...${NC}"
sudo nvram SystemAudioVolume=" "
echo -e "${GREEN}Sound effects on boot disabled. ✔${NC}"

# Enable snap-to-grid for icons on the desktop and in other icon views
echo -e "${YELLOW}Enabling snap-to-grid for desktop icons...${NC}"
/usr/bin/defaults write com.apple.finder FXEnableSnapToGrid -bool true
echo -e "${GREEN}Snap-to-grid enabled. ✔${NC}"

# Finder configurations
echo -e "${YELLOW}Configuring Finder preferences...${NC}"
/usr/bin/defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
/usr/bin/defaults write NSGlobalDomain AppleShowAllExtensions -bool true
/usr/bin/defaults write com.apple.finder AppleShowAllFiles -bool true
/usr/bin/defaults write com.apple.finder ShowPathbar -bool true
/usr/bin/defaults write com.apple.finder ShowStatusBar -bool true
echo -e "${GREEN}Finder preferences configured. ✔${NC}"

# General configurations
echo -e "${YELLOW}Configuring general system preferences...${NC}"
/usr/bin/defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true
/usr/bin/defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
/usr/bin/defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
/usr/bin/defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
/usr/bin/defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
/usr/bin/defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
/usr/bin/defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
/usr/bin/defaults write com.apple.finder WarnOnEmptyTrash -bool true
echo -e "${GREEN}General system preferences configured. ✔${NC}"

# Bluetooth and keyboard configurations
echo -e "${YELLOW}Improving Bluetooth audio quality...${NC}"
/usr/bin/defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
echo -e "${YELLOW}Configuring Terminal to use UTF-8...${NC}"
/usr/bin/defaults write com.apple.terminal StringEncodings -array 4
echo -e "${YELLOW}Adjusting keyboard illumination settings...${NC}"
/usr/bin/defaults write com.apple.BezelServices kDimTime -int 180
echo -e "${GREEN}Bluetooth, Terminal, and keyboard settings configured. ✔${NC}"

# Screenshot configurations
echo -e "${YELLOW}Configuring screenshot settings...${NC}"
mkdir -p ~/Screenshots
/usr/bin/defaults write com.apple.screencapture type -string "png"
/usr/bin/defaults write com.apple.screencapture location -string "${HOME}/Screenshots"
echo -e "${GREEN}Screenshot settings configured. ✔${NC}"

# Dock and Mission Control animations
echo -e "${YELLOW}Speeding up Dock and Mission Control animations...${NC}"
/usr/bin/defaults write com.apple.dock autohide-time-modifier -float 0.25
/usr/bin/defaults write com.apple.dock autohide-delay -float 0
/usr/bin/defaults write com.apple.dock expose-animation-duration -float 0.1
killall Dock
echo -e "${GREEN}Dock and Mission Control animations sped up. ✔${NC}"

# Trackpad and search configurations
echo -e "${YELLOW}Configuring trackpad and search settings...${NC}"
/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
/usr/bin/defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
/usr/bin/defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
/usr/bin/defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
echo -e "${GREEN}Trackpad and search settings configured. ✔${NC}"

echo -e "${GREEN}All configurations completed successfully. Please open a new terminal or restart your session for the changes to take effect. ✔${NC}"
