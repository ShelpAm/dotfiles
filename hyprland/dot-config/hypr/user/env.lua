-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Nvidia Video Acceleration
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct") -- VA-API hardware video acceleration, see https://wiki.hyprland.org/Nvidia/#va-api-hardware-video-acceleration

-- Force wayland
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto") -- Fixes softwares built with Electron.
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- fcitx
hl.env("QT_IM_MODULE", "fcitx")

-- QT tweaks
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct") -- Intended for changing font size of QT apps
