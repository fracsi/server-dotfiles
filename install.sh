#!/bin/sh

SCRIPT_ROOT=$(dirname "$0")

if [ "$#" -eq 0 ]; then
    echo "Usage: ./install.sh remote-machine:/path/to/put/files"
    exit 1
fi

REMOTE="${1%/}"

for item in "$SCRIPT_ROOT"/home/*; do
    target="$REMOTE/.$(basename "$item")"
    echo "Copying $item to $target"
    scp -q -r "$item" "$target"
done
