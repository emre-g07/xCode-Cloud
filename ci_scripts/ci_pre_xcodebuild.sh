#!/bin/sh

#  ci_pre_xcodebuild.sh
#  xCode-Cloud
#
#  Created by emregurs on 26.04.2023.
#  

if [[ -n $CI_PULL_REQUEST_NUMBER && $CI_XCODEBUILD_ACTION = 'archive' ]];
then
    echo "Replacing app icon with beta app icon."
    APP_ICON_PATH=$CI_WORKSHPACE/Shared/Assets.xcassets/AppIcon.appiconset

    # Remove existing app icon
    rm -rf $APP_ICON_PATH

    # Add beta app icon
    mv "$CI_WORKSPACE/ci_scripts/AppIcon-Beta.appiconset" $APP_ICON_PATH
fi
