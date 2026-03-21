
# fnm
set FNM_PATH "/home/fujiwara/.local/share/fnm"
if [ -d "$FNM_PATH" ]
  set PATH "$FNM_PATH" $PATH
  ~/.cargo/bin/fnm env | source
end
