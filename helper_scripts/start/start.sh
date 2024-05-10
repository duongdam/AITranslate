#!/bin/sh

# Set ENV before run this script
# ex. ENV=prod helper_scripts/start/start.sh

if [ -z "$ENV" ]; then
  echo "ENV is not set; please set it to 'dev' or 'prod'"
  exit 1
fi
export ENV="$ENV"

ROOT_PROJECT_PATH=$(git rev-parse --show-toplevel)
cd "$ROOT_PROJECT_PATH" || exit 1

bash helper_scripts/config/config.sh

bash helper_scripts/others/refresh_app.sh

bash helper_scripts/others/build_runner.sh

# run
#flutter run "lib/main.dart"
