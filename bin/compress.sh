#!/bin/bash -x

set -euo pipefail

if [ "$#" -ne 5 ]; then
    echo "Invalid number of parameters"
    echo "Usage: compress.sh <input> <fps> <bitrate:v> <bitrate:a/copy> <output>"
    echo "Example: compress.sh foo.mp4 30 1024k 128k bar.mp4"
    exit 1
fi

INPUT="$1"
FPS="$2"
VBIT="$3"
ABIT="$4"
OUTPUT="$5"

AUDIO=("-c:a" "aac" "-b:a" "$ABIT")

# Don't murder audio quality with recompress if already appropriate bitrate
if [ "$ABIT" == "copy" ]; then
    AUDIO=("-c:a" "copy")
fi

ffmpeg -y -i "$INPUT" -c:v libx264 -r "$FPS" -preset slow -b:v "$VBIT" -pass 1 -vsync cfr -f null /dev/null && \
    ffmpeg -y -i "$INPUT" -c:v libx264 -r "$FPS" -b:v "$VBIT" -pass 2 "${AUDIO[@]}" -preset slow "$OUTPUT"

rm ffmpeg2pass-0.log
rm ffmpeg2pass-0.log.mbtree

