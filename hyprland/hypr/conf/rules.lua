-- Window Rules

-- Terminals & editors: disable blur (commented out in original)
-- hl.window_rule({ match = { class = "foot" },    no_blur = true })
-- hl.window_rule({ match = { class = "Emacs" },   no_blur = true })
-- hl.window_rule({ match = { class = "neovide" }, no_blur = true })
-- hl.window_rule({ match = { class = "Alacritty" },    no_blur = true })
-- hl.window_rule({ match = { class = "dev.zed.Zed" },  no_blur = true })

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
