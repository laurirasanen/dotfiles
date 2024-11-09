# Common aliases.
# Add `source ~/.aliases.sh` to your shell cfg.

export PATH=$PATH:$HOME/bin:$HOME/.cargo/bin:$HOME/.local/bin
export HISTSIZE=100

# jump 1 word with ctrl-arrow in some terminals
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

function screen_brightness_wlroots() {
    brightness="${1:-1}"
    temp="${2:-6500}"

    gammastep -b "$brightness" -O "$temp"
}
function screen_brightness_x11() {
    redshift -x

    brightness="${1:-1}"
    temp="${2:-6500}"

    xrandr --output DP-1 --brightness "$brightness"
    xrandr --output DP-3 --brightness "$brightness"

    redshift -O "$temp"
}
function screen_brightness() {
    if [ "$XDG_SESSION_TYPE" = "x11" ]; then
        screen_brightness_x11 "$@"
    else
        screen_brightness_wlroots "$@"
    fi
}
alias sb=screen_brightness

function upload() {
    if [ "$#" -ne 2 ]; then
        echo "Invalid number of parameters"
        echo "usage: upload <target_dir> <file>"
        return
    fi

    if [ -z "$FILE_STORAGE_API_KEY" ]; then
        echo "No API key set, did you forget to 'source ~/.tokens'?"
        return
    fi

    echo "Uploading to $1/$2"

    curl --request PUT \
        --url "$FILE_STORAGE_API_URL/$1/$2" \
        --header "AccessKey: $FILE_STORAGE_API_KEY" \
        --header "Content-Type: application/octet-stream" \
        --header "accept: application/json"  \
        --data-binary "@$2"

    echo ""
    echo "$FILE_STORAGE_EXTERNAL_URL/$1/$2 (copied to clipboard)"
    echo "$FILE_STORAGE_EXTERNAL_URL/$1/$2" | xclip -sel clip
}

function upload_all() {
    for X in *; do
        upload $1 $X
    done
}

function randomize_filenames() {
    for X in *; do
        if [ -f "$X" ]; then
            EXT="${X##*.}"
            FILENAME=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 16)
            mv --no-clobber --verbose "$X" "$FILENAME.$EXT"
        fi
    done
}

alias remove_exif="mogrify -verbose -strip *.jpg"

alias tf2="steam -applaunch 440 -noborder -windowed -w 1920 -h 1080 +fps_max 240"

alias ga="git add"
alias gts="git status"
alias gd="git diff"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpl="git pull"
alias gc="git commit"
alias gup="git fetch && git pull && git submodule update --recursive"
alias greb="git fetch && git pull && git rebase origin/master"

alias ls="eza --long --all --header --group --icons=always"
alias mkdir="mkdir -p"

alias disc="firejail discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy"

