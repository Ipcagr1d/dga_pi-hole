#!/bin/bash

# This script clones related repositories for dependencies

# Define an array of repository URLs
declare -a REPOS=(
  "https://github.com/ybubnov/deep-lookup.git"
  "https://github.com/baderj/domain_generation_algorithms.git"
)

# Function to clone a repository
clone_repo() {
  local repo_url="$1"
  git clone "$repo_url"
}

# Loop through the array and clone each repository
for repo in "${REPOS[@]}"
do
  clone_repo "$repo"
done