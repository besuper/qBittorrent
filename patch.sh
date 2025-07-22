#!/bin/bash

patch_directory="patches"
project_directory="qbittorrent"

if ! command -v git &> /dev/null; then
    echo "Error: 'git' command not found"
    exit 1
fi

if [ ! -d "$patch_directory" ]; then
    echo "Error: '$patch_directory' folder not found"
    exit 1
fi

if [ ! -d "$project_directory" ]; then
    echo "Error: '$project_directory' folder not found"
    exit 1
fi

pushd "$project_directory" > /dev/null || exit 1

for patch_file in "../$patch_directory"/*.patch; do
    echo "Applying $(basename "$patch_file")"
    git apply --ignore-space-change --ignore-whitespace "$patch_file"
done

popd > /dev/null