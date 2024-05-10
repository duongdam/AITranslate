#!/bin/zsh

export ENV="dev"
ROOT_PROJECT_PATH=$(git rev-parse --show-toplevel)
cd "$ROOT_PROJECT_PATH" || exit 1
bash helper_scripts/start/start.sh
