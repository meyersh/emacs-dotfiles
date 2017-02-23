#!/bin/bash
mdfind -onlyin $HOME -name "$@" \
    | grep -v "$HOME/Library/" \
    | grep -v "$HOME/Pictures/" \
    | grep -v "$HOME/Music/"
mdfind -onlyin $HOME/.emacs.d -name "$@"
