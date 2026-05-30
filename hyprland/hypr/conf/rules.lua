-- Window Rules 

-- Terminals & editors: disable blur (commented out in original)
-- hl.window_rule({ match = { class = "foot" },    no_blur = true })
-- hl.window_rule({ match = { class = "Emacs" },   no_blur = true })
-- hl.window_rule({ match = { class = "neovide" }, no_blur = true })
-- hl.window_rule({ match = { class = "Alacritty" },    no_blur = true })
-- hl.window_rule({ match = { class = "dev.zed.Zed" },  no_blur = true })

-- Window rules: float
hl.window_rule({ match = { class = "steam"  }, float = true })
hl.window_rule({ match = { class = "wechat" }, float = true })
hl.window_rule({ match = { class = "QQ"     }, float = true })

-- Dialogs: center + float (merged per title for clarity)
local dialog_titles = {
    "Open File",
    "Select a File",
    "Choose wallpaper",
    "Open Folder",
    "Save As",
    "Library",
    "File Upload",
}
for _, t in ipairs(dialog_titles) do
    hl.window_rule({ match = { title = t }, center = true, float = true })
end

-- WeChat main window
hl.window_rule({ match = { title = "微信" }, float = true })

-- Launchers (ulauncher / albert / vicinae)
hl.window_rule({
    match        = { class = "ulauncher|albert|vicinae" },
    float        = true,
    no_blur      = true,
    pin          = true,
    stay_focused = true,
    border_size  = 0,
})

-- holo_layer
hl.window_rule({
    match   = { title = "holo_layer.py" },
    float   = true,
    no_blur = true,
    no_anim = true,
})
-- hl.window_rule({ match = { title = "holo_layer.py" }, monitor = "1" })
-- hl.window_rule({ match = { title = "holo_layer.py" }, fullscreen = true })  -- was fakefullscreen

-- Nemo desktop
hl.window_rule({
    match            = { class = "Nemo-desktop" },
    size             = "100% 100%",
    move             = "0 0",
    float            = true,
    no_blur          = true,
    no_anim          = true,
    pin              = true,
    border_size      = 0,
    no_initial_focus = true,
})

-- Flameshot
hl.window_rule({
    match   = { class = "flameshot" },
    no_anim = true,
    move    = "0 0",
    pin     = true,
    monitor = "1",
})
