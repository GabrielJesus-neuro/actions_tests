#!/bin/bash

files=($(ls | grep -v '\.sh$'))

echo "Installing local git hooks..."

# Adjust to work into previous path
for file in "${files[@]}"; do
    cp "./${file}" "../.git/hooks/${file}"
    chmod +x "../.git/hooks/${file}"
done