-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function ()
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)

-- Can be called multiple times

hl.on("hyprland.start", function()
    --- Background services
    hl.exec_cmd("systemctl --user start hyprpolkitagent.service")
    hl.exec_cmd("systemctl --user start tmux.service")

    hl.exec_cmd("swaync")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("hypridle")

    hl.exec_cmd("dbus-update-activation-environment --systemd --all") --Sync env

    --- Foreground apps
    hl.exec_cmd(Terminal, { workspace = 1 })
    hl.exec_cmd("firefox", { workspace = 2 })
    hl.exec_cmd("qq", { workspace = 3 })
    hl.exec_cmd("flatpak run com.tencent.WeChat", { workspace = 3 })
    hl.exec_cmd("thunderbird", { workspace = 4 })
    hl.exec_cmd("clash-verge", { workspace = 4 })
end)
