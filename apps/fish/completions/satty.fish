complete -c satty -s c -l config -d 'Path to the config file. Otherwise will be read from XDG_CONFIG_DIR/satty/config.toml' -r
complete -c satty -s f -l filename -d 'Path to input image or \'-\' to read from stdin' -r
complete -c satty -s o -l output-filename -d 'Filename to use for saving action or \'-\' to print to stdout. Omit to disable saving to file. Might contain format specifiers: <https://docs.rs/chrono/latest/chrono/format/strftime/index.html>' -r
complete -c satty -l corner-roundness -d 'Draw corners of rectangles round if the value is greater than 0 (Defaults to 12) (0 disables rounded corners)' -r
complete -c satty -l initial-tool -l init-tool -d 'Select the tool on startup' -r -f -a "pointer\t''
crop\t''
line\t''
arrow\t''
rectangle\t''
ellipse\t''
text\t''
marker\t''
blur\t''
highlight\t''
brush\t''"
complete -c satty -l copy-command -d 'Configure the command to be called on copy, for example `wl-copy`' -r
complete -c satty -l annotation-size-factor -d 'Increase or decrease the size of the annotations' -r
complete -c satty -l actions-on-enter -d 'Actions to perform when pressing Enter' -r -f -a "save-to-clipboard\t''
save-to-file\t''
exit\t''"
complete -c satty -l actions-on-escape -d 'Actions to perform when pressing Escape' -r -f -a "save-to-clipboard\t''
save-to-file\t''
exit\t''"
complete -c satty -l actions-on-right-click -d 'Actions to perform when hitting the copy Button' -r -f -a "save-to-clipboard\t''
save-to-file\t''
exit\t''"
complete -c satty -l font-family -d 'Font family to use for text annotations' -r
complete -c satty -l font-style -d 'Font style to use for text annotations' -r
complete -c satty -l primary-highlighter -d 'The primary highlighter to use, secondary is accessible with CTRL' -r -f -a "block\t''
freehand\t''"
complete -c satty -l brush-smooth-history-size -d 'Experimental feature: How many points to use for the brush smoothing algorithm. 0 disables smoothing. The default value is 0 (disabled)' -r
complete -c satty -l action-on-enter -d 'Action to perform when pressing Enter. Preferably use the `actions_on_enter` option instead' -r -f -a "save-to-clipboard\t''
save-to-file\t''
exit\t''"
complete -c satty -l fullscreen -d 'Start Satty in fullscreen mode'
complete -c satty -l early-exit -d 'Exit directly after copy/save action'
complete -c satty -l save-after-copy -d 'After copying the screenshot, save it to a file as well Preferably use the `action_on_copy` option instead'
complete -c satty -s d -l default-hide-toolbars -d 'Hide toolbars by default'
complete -c satty -l focus-toggles-toolbars -d 'Experimental: Whether to toggle toolbars based on focus. Doesn\'t affect initial state'
complete -c satty -l default-fill-shapes -d 'Experimental feature: Fill shapes by default'
complete -c satty -l disable-notifications -d 'Disable notifications'
complete -c satty -l profile-startup -d 'Print profiling'
complete -c satty -l no-window-decoration -d 'Disable the window decoration (title bar, borders, etc.) Please note that the compositor has the final say in this. Requires xdg-decoration-unstable-v1'
complete -c satty -l right-click-copy -d 'Right click to copy. Preferably use the `action_on_right_click` option instead'
complete -c satty -s h -l help -d 'Print help'
complete -c satty -s V -l version -d 'Print version'
