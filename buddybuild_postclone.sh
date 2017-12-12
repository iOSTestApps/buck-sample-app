#!/bin/bash

set -e

brew update
brew tap caskroom/cask
brew cask install java
brew tap facebook/fb
brew install buck

buck project --ide xcode buddybuild_sample_app

sed -i.bak "s/\.\.\/buck-out\/gen\/ios\/\([^\.]*.xcconfig\)/\1/" ios/ios.xcodeproj/project.pbxproj

find buck-out -name "*.xcconfig" -type f -exec mv {} ios/ \;
