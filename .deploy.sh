#!/usr/bin/env bash
set -o errexit -o nounset

# Get curent commit revision
rev=$(git rev-parse --short HEAD)

# Checkout docs branch
branch=arc42

# Initialize gh-pages checkout
mkdir -p site
(
  cd site
  git init
  git config user.name "${GH_USER_NAME}"
  git config user.email "${GH_USER_EMAIL}"
  git remote add upstream "https://${GH_TOKEN}@${GH_REF}"
  git fetch upstream
  git reset upstream/gh-pages
  git checkout $branch
)

# Build the documentation
mkdocs build --clean

# Replace current build version and date
(
  CURRENT_VERSION=$(git log --pretty=format:'%h' -n 1)
  CURRENT_DATE=$(git show -s --format=%ci $CURRENT_VERSION)
  echo $CURRENT_VERSION "@" $CURRENT_DATE
  sed -i "s/@@VERSION@@/$CURRENT_VERSION/g" site/index.html
  sed -i "s/@@TIMESTAMP@@/$CURRENT_DATE/g" site/index.html
)

# Commit and push the documentation to gh-pages
(
  cd site
  touch .
  git add -A .
  git commit -m "Rebuild pages at ${rev} with branch ${branch}"
  git push -q -f upstream HEAD:gh-pages
)
