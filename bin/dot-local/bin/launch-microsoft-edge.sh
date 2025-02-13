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


exec microsoft-edge \
    --password-store=gnome-libsecret \
    # --ozone-platform=wayland \
    --enable-wayland-ime \
    --ozone-platform-hint=auto \
    "$@"
