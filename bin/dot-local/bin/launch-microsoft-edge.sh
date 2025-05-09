#!/usr/bin/bash

# Explanation on parameters:
#
# --ozone-platform=wayland
#
#   Forces Edge in wayland mode.
#
#
# --password-store=gnome-libsecret
#
#   Fixes issue of not remembering password

edge='microsoft-edge-dev'

args=(
    --password-store=gnome-libsecret
    --enable-wayland-ime
    --ozone-platform=wayland
    --ozone-platform-hint=auto
)

exec ${edge} ${args[@]} "$@"

