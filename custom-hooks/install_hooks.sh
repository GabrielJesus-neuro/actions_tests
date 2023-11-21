#!/bin/bash

files=($(ls | grep -v '\.sh$'))

echo "Installing local git hooks..."

for file in "${files[@]}"; do
    cp "./${file}" "../.git/hooks/${file}"
    chmod +x "../.git/hooks/${file}"
done