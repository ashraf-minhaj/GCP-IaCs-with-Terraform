#!/bin/bash

# Ensure script is run from the root of the git repository
if [ ! -f .gitignore ]; then
  echo ".gitignore file not found in the current directory."
  exit 1
fi

# Read the .gitignore file and generate a list of patterns to match
patterns=$(grep -v '^#' .gitignore | grep -v '^$')

# List of files and directories to delete
files_to_delete=""

# Loop through each pattern and find matching files and directories
for pattern in $patterns; do
  # Ignore comments and empty lines
  if [[ -z "$pattern" || "$pattern" =~ ^# ]]; then
    continue
  fi

  # Find and delete matching files or directories
  matches=$(find . -name "$pattern")
  if [ -n "$matches" ]; then
    files_to_delete="$files_to_delete\n$matches"
    sudo rm -rf $matches
  fi
done

# Output files and directories deleted
if [ -n "$files_to_delete" ]; then
  echo -e "Deleted the following files/folders matching .gitignore patterns:\n$files_to_delete"
else
  echo "No matching files or directories found."
fi
