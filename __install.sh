#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

set -o allexport
source "${SCRIPT_DIR}/.env"
set +o allexport

set -e

if [ -d "$VCS_EXTENSIONS_DIR" ]; then
    echo "The VCS dark theme seems to be already installed. Skipping."
    exit 0
fi

echo "Installing VCS dark theme from kneczaj..."

themeDir=$(realpath "./")

echo "Linking \"$themeDir\" to \"$VCS_EXTENSIONS_DIR/theme-dark\""

ln -s "$themeDir" "$VCS_EXTENSIONS_DIR/theme-dark"

cd "$SCRIPT_DIR"
npm install
npm run build
