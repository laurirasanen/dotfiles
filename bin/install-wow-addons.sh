#!/bin/bash -x

version=_retail_
addons_path="$HOME/World of Warcraft/$version/Interface/AddOns/"

cp ~/Downloads/wow-addons/*.zip "$addons_path"
cd "$addons_path"
unzip "./*.zip"
rm ./*.zip
