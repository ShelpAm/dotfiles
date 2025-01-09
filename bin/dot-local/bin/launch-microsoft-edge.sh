#!/usr/bin/env bash

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

# --ozone-platform=wayland

exec microsoft-edge --password-store=gnome-libsecret "$@"
