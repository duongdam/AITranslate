#!/bin/zsh

# set ENV before run this script
# ex. ENV=prod helper_scripts/config/config.sh

if [ -z "$ENV" ]; then
  echo "ENV is not set; please set it to 'dev' or 'prod'"
  exit 1
fi

ROOT_PROJECT_PATH=$(git rev-parse --show-toplevel)
cd "$ROOT_PROJECT_PATH" || exit 1

# replace .env from .env.$ENV
cp -r .env."$ENV" .env
echo "--->OK Replaced .env.$ENV to .env"

# copy for ios
cp -r ios/Runner/Info-"$ENV".plist ios/Runner/Info.plist
echo "--->OK Copied ios/Runner/Info-$ENV.plist to ios/Runner/Info.plist"

cp -r ios/GoogleService-Info-"$ENV".plist ios/GoogleService-Info.plist
echo "--->OK Copied ios/GoogleService-Info-$ENV.plist to ios/GoogleService-Info.plist"

# copy for android
cp -r android/app/google-services-"$ENV".json android/app/google-services.json
echo "--->OK Copied android/app/google-services-$ENV.json to android/app/google-services.json"

echo "--->OK Configured for env: $ENV"
