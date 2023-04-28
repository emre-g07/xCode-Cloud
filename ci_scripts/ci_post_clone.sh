#!/bin/sh

#  ci_post_clone.sh
#  xCode-Cloud
#
#  Created by emregurs on 26.04.2023.
#  

if [[ -n $CI_PULL_REQUEST_NUMBER ]];
then
    echo "This build started from a pull request."

    # Perform an action only if the build starts from a pull request.
fi
