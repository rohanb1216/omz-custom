alias polyreload="zsh $HOME/.config/polybar/launch.sh >/dev/null 2>&1 	"
alias repo='repo --color=always'
alias update-helper=" yay && echo 'Done, exiting' && sleep 2 && exit"
# alias dgateway= firefox "$(route -n | awk '/UG/{print $2}' | head -n 1)"

dgateway() {
    firefox $(route -n | awk "/UG/{print \$2}" | head -n 1)
}

aosp_ld_config() {
    if [ -z "$ANDROID_BUILD_TOP" ]; then
        :
    else
        CLANG_PATH="$ANDROID_BUILD_TOP/prebuilts/clang/host/linux-x86"
        CLANG_VERSION_STRING=$(cat "$ANDROID_BUILD_TOP/build/soong/cc/config/global.go" | grep 'ClangDefaultVersion ')
        if [[ $CLANG_VERSION_STRING =~ clang-r([0-9a-zA-Z]+) ]]; then
            CLANG_VERSION="${MATCH}"
            CLANG_PATH="$CLANG_PATH/$CLANG_VERSION/bin"
            ln -s "$CLANG_PATH/lld" "$CLANG_PATH/ld"
            echo "Linked lld to ld for $CLANG_VERSION"
        fi
    fi
}
