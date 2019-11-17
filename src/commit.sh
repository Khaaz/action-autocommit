#!/bin/bash

set -eo pipefail

cd $GITHUB_WORKSPACE

BRANCH_OR_TAG=`awk -F/ '{print $2}' <<< $GITHUB_REF`
CURRENT_BRANCH=`awk -F/ '{print $NF}' <<< $GITHUB_REF`

if [ "$BRANCH_OR_TAG" == "heads" ]; then
  SOURCE_TYPE="branch"
else
  SOURCE_TYPE="tag"
fi

echo "::[notice] # Pull"
git pull origin $CURRENT_BRANCH
echo "::[notice] # Commit"
git add .
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git commit -m "Auto-Commit for ${SOURCE_TYPE} ${CURRENT_BRANCH}: ${GITHUB_SHA}" || true
echo "::[notice] # Push"
git push origin HEAD:${CURRENT_BRANCH}