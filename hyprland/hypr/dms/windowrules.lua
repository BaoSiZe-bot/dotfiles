-- DMS Window Rules — managed by DankMaterialShell
-- Do not edit manually; changes may be overwritten

-- DMS-RULE: id=dms-floating-windows, name=DMS Floating Windows
hl.window_rule({ match = { class = "^com.danklinux.dms$" }, float = true })

-- DMS-RULE: id=wr_1786493343930100421, name=Float Wechat&QQ&Steam
hl.window_rule({ match = { class = "wechat|QQ|steam" }, float = true })

-- DMS-RULE: id=wr_1786493436856909076, name=Float Wechat Main Window
hl.window_rule({ match = { title = "微信" }, float = true })

-- DMS-RULE: id=wr_1786493463405877743, name=Float Launchers
hl.window_rule({ match = { class = "ulauncher|albert|vicinae" }, float = true, no_blur = true, pin = true })

-- DMS-RULE: id=wr_1786493624316556398, name=Float Holo Layer
hl.window_rule({ match = { title = "holo_layer.py" }, float = true, no_blur = true, no_anim = true })

-- DMS-RULE: id=wr_1786493706200994445, name=Pin Flameshot
hl.window_rule({ match = { class = "flameshot" }, no_anim = true, pin = true, move = { 0, 0 }, monitor = "1" })
