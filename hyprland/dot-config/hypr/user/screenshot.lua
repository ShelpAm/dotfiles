hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region --freeze"))
hl.layer_rule({ -- Fixes slurp issue (eliminates boarder)
  name = "screenshot-mode",
  -- match = { namespace = "screenshot" },
  match = { namespace = "selection" },
  no_anim = true,
})
