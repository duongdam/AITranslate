#!/bin/sh

# Fail this script if any subcommand fails.
#set -e

# The default execution directory of this script is the ci_scripts directory.
cd "$CI_PRIMARY_REPOSITORY_PATH" # change working directory to the root of your cloned repo.

# Install Flutter using git.
git clone https://github.com/flutter/flutter.git --depth 1 -b stable "$HOME"/flutter
export PATH="$PATH:$HOME/flutter/bin"

# Install Flutter artifacts for iOS (--ios), or macOS (--macos) platforms.
flutter precache --ios

# Install CocoaPods using Homebrew.
HOMEBREW_NO_AUTO_UPDATE=1 # disable homebrew's automatic updates.
brew install cocoapods

# set ENV for build
ENV="prod"
DEV_BRANCH_PREFIX="devs/"
#CURRENT_BRANCH=$(git branch --show-current)
if [[ $CI_BRANCH == $DEV_BRANCH_PREFIX* ]]; then
  ENV="dev"
fi

# if WF_ENV is not empty, then use it
if [ -n "$WF_ENV" ]; then
  ENV="$WF_ENV"
fi

export ENV=$ENV
echo "building for env: $ENV"

bash helper_scripts/config/config.sh

bash helper_scripts/others/refresh_app.sh

bash helper_scripts/others/build_runner.sh

exit 0
