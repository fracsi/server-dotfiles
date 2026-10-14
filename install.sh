#!/bin/sh

SCRIPT_ROOT=$(dirname "$0")

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh remote-machine:/path/to/put/files"
    exit 1
fi

REMOTE="${1%/}"

for dotfile in "$SCRIPT_ROOT"/home/*; do
    target=".$(basename "$dotfile")"
    echo "Copying $target to $REMOTE/$target"
    scp -q "$dotfile" "$REMOTE/$target"
done
