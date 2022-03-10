#!/bin/bash

set -euo pipefail
shopt -s nullglob

ADDITIONAL=""
PROJECTS=(*.uproject)

if [[ ${#PROJECTS[@]} -gt 0 ]]; then
    ADDITIONAL="$(pwd)/${PROJECTS[0]}"
    echo "Found project, passing to cli: '$ADDITIONAL'"
fi

"$HOME/UnrealEngine/UE_5-4-2/Engine/Binaries/Linux/UnrealEditor" $ADDITIONAL

