if [ -z "$1" ]
    then
        TARGET="~/Projects/linux-conf"
    else
        TARGET="$1/linux-conf"
fi

cp ~/.tmux.conf $TARGET
cp ~/.zhrc $TARGET
cp ~/.bash_profile $TARGET

