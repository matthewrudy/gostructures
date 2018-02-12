#!/bin/bash

# import Github's key for PR merges
curl https://github.com/web-flow.gpg | gpg --import

# import @matthewrudy's key... because I trust myself
curl https://keybase.io/matthewrudy/pgp_keys.asc | gpg --import

git verify-commit $TRAVIS_COMMIT

if [[ $? -ne 0 ]] ; then
    echo 'commit cannot be verified'
    exit 1
fi
