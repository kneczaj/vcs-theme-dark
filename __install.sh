#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

set -o allexport
source "${SCRIPT_DIR}/.env"
set +o allexport

set -e

if [ -d "$VCS_EXTENSIONS_DIR/kneczaj-theme-dark" ]; then
    echo "The VCS dark theme dir exists. Skipping."
    exit 0
fi

if [ -L "$VCS_EXTENSIONS_DIR/kneczaj-theme-dark" ]; then
    echo "The VCS dark theme seems to be already installed. Skipping."
    exit 0
fi

echo "Installing VCS dark theme from kneczaj..."

dir=$(realpath "${SCRIPT_DIR}")
target="${VCS_EXTENSIONS_DIR}/kneczaj-theme-dark"
parentdir="$(dirname "$target")"
echo "$parentdir"
mkdir -p "${parentdir}"

echo "Linking \"$dir\" to \"$target\""

ln -s "$dir" "$target"

cd "$SCRIPT_DIR"
npm install
npm run build
