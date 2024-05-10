#!/bin/sh

####
# SET LOCALE BEFORE RUN THIS SCRIPT
# https://stackoverflow.com/a/69395720
#####

flutter clean # clean flutter

flutter pub get # get packages
ROOT_PROJECT_PATH=$(git rev-parse --show-toplevel)
cd "$ROOT_PROJECT_PATH"/ios || exit # go to ios folder

rm Podfile.lock # remove old lock file
rm -rf Pods # remove old pods
rm -rf .symlinks # remove old symlinks

pod repo update # update pod repo

arch -x86_64 pod install # install pods


