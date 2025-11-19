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
    # --enable-features=UseOzonePlatform,WaylandLinuxDrmSyncobj
    --ozone-platform=wayland
    --ozone-platform-hint=auto
)

# If profile lock broken, rm the lock.
if [ ! -e ~/.config/microsoft-edge-dev/SingletonSocket ]; then
    rm ~/.config/microsoft-edge-dev/Singleton*
fi
exec ${edge} ${args[@]} "$@"

