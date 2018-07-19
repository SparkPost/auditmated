#!/bin/bash
BRANCH=`git rev-parse --abbrev-ref HEAD`
MESSAGE="$BRANCH npm audit fix"

if [[ $BRANCH = 'master' ]] || [[ $BRANCH = 'develop' ]] ; then
  echo 'skipping audit on '$BRANCH' branch'
  exit 0
fi

npm audit fix
git add package.json package-lock.json
git commit --no-verify -m "$MESSAGE"

# if audit fix didn't change anything the commit will exit with non-0 exit code
# catch that error code and exit successfully
if [[ $? -ne 0 ]] ; then
  echo 'audit: minor and patch version of deps have no known security issues'
fi
