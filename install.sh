#!/usr/bin/env bash

function yay_install(){
    while read pkg
    do
        if [[ "$pkg" = "" || "$pkg" =~ ^#.* ]];then
            continue
        fi
        yay -S --noconfirm $pkg
    done < yay.list
}

function go_install(){
    while read pkg
    do
        if [[ "$pkg" = "" || "$pkg" =~ ^#.* ]];then
            continue
        fi
        go install $pkg
    done < go.list
}

case $1 in
    "archlinux")
        yay_install
        go_install;;
    "go")
        go_install;;
    "yay")
        yay_install;;
    *)
        echo "require 'archlinux' 'yay' or 'go'"
esac
