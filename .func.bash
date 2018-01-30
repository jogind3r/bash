function mkcd {
    mkdir $1 2>/dev/null
    if [ $? -eq 0 ]; then
        cd $1;
    else
        echo "could not create dir $1"
    fi
}
function mkpcd {
    mkdir -p $1 2>/dev/null
    if [ $? -eq 0 ]; then
        cd $1;
    else
        echo "could not create dir $1"
    fi
}

function cdf {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}
# function gitpull() {
#     branch="$(git branch | grep \* | cut -d ' ' -f2)"
#     if [ -z "$var" ]
#     then
#         echo "\$Branch issue"
#
#     else
#       git pull origin master
#
#     fi
# }


# Image optimization tools
png() {
    pngcrush -brute "$1"{,.} && du -b "$1"{,.}
}
gif() {
    gifsicle -O "$1" -o "$1." && du -b "$1"{,.}
}
jpeg() {
    jpegtran "$1" > "$1." && du -b "$1"{,.}
}
# Just for easy access in history
mpng() {
    mv "$1"{.,}
}
mgif() {
    newsize=$(wc -c <"$1.")
    oldsize=$(wc -c <"$1")
    if [ $oldsize -gt $newsize ] ; then
        mv "$1"{.,}
    else
        rm "$1."
    fi
}
mjpeg() {
    mv "$1"{.,}
}
