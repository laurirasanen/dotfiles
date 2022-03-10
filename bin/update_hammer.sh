#!/bin/bash

set -euo pipefail

echo "Make sure that the TF2 Windows Client depo is up to date."
echo "You should run:"
echo "  steam -console"
echo "And then via Steam console:"
echo "  download_depot 440 232251"

read -p "Press enter to continue"

cd "$HOME/tf_hammer/"
cp -rs --update=none "$HOME/.steam/steam/steamapps/common/Team Fortress 2/"* ./
cp -rs --update=none "$HOME/.steam/steam/ubuntu12_32/steamapps/content/app_440/depot_232251/"* ./

