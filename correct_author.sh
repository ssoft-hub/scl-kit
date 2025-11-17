#!/bin/sh

git filter-branch --force --env-filter '
OLD_EMAIL="stepanov.a.a@topaz-atcs.com"
#OLD_EMAIL="andrei.s@coppermountaintech.com"
CORRECT_NAME="ssoft"
CORRECT_EMAIL="and.stepanov@gmail.com"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags