#!/usr/bin/env bash

echo "Current directory: $(pwd)"

# Remove all executable files in the specified directory
find $(pwd) -type f -executable ! -name "*.sh" -delete
find $(pwd) -type f \( -name "*.cmi" -o -name "*.cmo" \) -delete