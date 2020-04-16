#!/bin/env bash

BRANCH="$(git rev-parse --abbrev-ref HEAD)"
MESSAGE="$BRANCH npm audit fix"

if [[ $BRANCH = 'master' ]] || [[ $BRANCH = 'develop' ]]; then
  echo 'skipping audit on '"$BRANCH"' branch'
  exit 0
fi

if [[ "$(npm audit fix)" ]]; then
  # if audit fix didn't change anything the commit will exit with non-0 exit code
  # catch that error code and exit successfully
  echo 'audit: minor and patch version of deps have no known security issues'
  exit 0
fi

git add package.json package-lock.json &&
git commit --no-verify -m "$MESSAGE"
