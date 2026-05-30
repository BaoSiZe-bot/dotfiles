-- Audio buttons
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), { locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true })

-- Resize submap
hl.bind("SUPER + SHIFT + R", hl.dsp.submap("resize"))
-- hl.submap("resize", function()
--     hl.bind("h", hl.dsp.resize_active({ x = -10, y = 0 }), { repeating = true })
--     hl.bind("l", hl.dsp.resize_active({ x = 10,  y = 0 }), { repeating = true })
--     hl.bind("k", hl.dsp.resize_active({ x = 0,   y = -10 }), { repeating = true })
--     hl.bind("j", hl.dsp.resize_active({ x = 0,   y = 10 }), { repeating = true })
--     hl.bind("escape", hl.dsp.submap("reset"))
-- end)

-- Scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e+1" }))

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Layout messages
hl.bind("SUPER + period",       hl.dsp.layout("move +col"))
hl.bind("SUPER + comma",        hl.dsp.layout("move -col"))
hl.bind("SUPER + SHIFT + period", hl.dsp.layout("movewindowto r"))
hl.bind("SUPER + SHIFT + comma",  hl.dsp.layout("movewindowto l"))
hl.bind("SUPER + SHIFT + up",     hl.dsp.layout("movewindowto u"))
hl.bind("SUPER + SHIFT + down",   hl.dsp.layout("movewindowto d"))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
