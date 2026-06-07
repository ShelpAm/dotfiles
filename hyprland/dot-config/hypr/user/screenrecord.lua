-- For xwaylandvideobridge, see https://wiki.hypr.land/Useful-Utilities/Screen-Sharing/.

hl.on("hyprland.start", function()
    -- This doesn't hide, so temporarily disabled.
    -- hl.exec_cmd("xwaylandvideobridge")
end)


hl.window_rule({
    name = "xwayland-video-bridge-fixes",
    match = { class = "xwaylandvideobridge" },

    no_initial_focus = true,
    no_focus = true,
    no_anim = true,
    no_blur = true,
    max_size = { 1, 1 },
    opacity = 0.0,
})
