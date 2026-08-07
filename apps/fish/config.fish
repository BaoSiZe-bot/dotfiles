# cargo install vivid fd-find bat du-dust yazi-fm yazi-cli cargo-update cargo-about eza bottom gitui tlrc zellij viu nu nufmt starship zoxide ripgrep
# cargo install fish --tag 4.0.0
# cargo install --git https://github.com/d1y/scls
# cargo install --git https://github.com/wlh320/rime-ls
# fish_config theme save "Catppuccin Frappe"
# BUG: async prompt has a bug when i switch directory
set fish_greeting
set -gx HELIX_RUNTIME ~/softwares/helix/runtime/
set -gx PATH ~/software/luals/bin ~/.config/emacs/bin ~/.config/doomemacs/bin ~/.bin ~/.local/bin ~/.cargo/bin ~/.local/share/lvim/mason/bin $PATH
set -gx LS_COLORS $(vivid generate catppuccin-frappe)
set -gx MANPAGER "bat"
# set -gx LESS_TERMCAP_mb '\e[1;31m'      # begin bold
# set -gx LESS_TERMCAP_md '\e[1;34m'      # begin blink
# set -gx LESS_TERMCAP_so '\e[01;45;37m'  # begin reverse video
# set -gx LESS_TERMCAP_us '\e[01;36m'     # begin underline
# set -gx LESS_TERMCAP_me '\e[0m'         # reset bold/blink
# set -gx LESS_TERMCAP_se '\e[0m'         # reset reverse video
# set -gx LESS_TERMCAP_ue '\e[0m'         # reset underline
set -gx GROFF_NO_SGR 1                   # for konsole
set -gx EDITOR nvim
set -gx MYVIMDIR .vim
abbr -a -- c 'clear; catnap'
abbr -a -- fd 'fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | tv'
abbr -a -- Z 'cd $(fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=d | tv)'
abbr -a -- oe 'xdg-open $(fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | tv)'
abbr -a -- ee '$EDITOR $(fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | tv)'
abbr -a -- hs 'history | tv'
abbr -a -- p 'paru'
abbr -a -- ps 'paru -S'
abbr -a -- pl 'paru -Ql'
abbr -a -- pr 'paru -R' #To remove a package and its dependencies
abbr -a -- pR 'paru -Rs' #To remove a package and its dependencies
abbr -a -- pq 'paru -Qs' #To search for already installed packages
abbr -a -- pi 'paru -Qi' #To display information about locally installed packages
abbr -a -- par 'paru -c'  # remove orphaned packages
abbr -a -- pc 'paru -Scc' #removing old packages from cache
abbr -a -- a 'aptitude'
abbr -a -- as 'sudo aptitude install'
abbr -a -- al 'apt list --installed'
abbr -a -- ar 'sudo apt remove --purge'
abbr -a -- aR 'sudo aptitude remove --purge-unused' #aptitude will remove package's dependencies automatically
abbr -a -- aq 'apt list --installed | rg ""'
abbr -a -- ai 'apt-cache policy'
abbr -a -- aar 'sudo apt autoremove'
abbr -a -- ac 'sudo rm /var/cache/apt/archives/*'
abbr -a -- au 'sudo aptitude update && sudo aptitude upgrade && sudo aptitude full-upgrade'
abbr -a -- kl 'sudo rm /var/lib/dpkg/lock-frontend /var/lib/pacman/db.lck'
abbr -a -- la 'eza -a --icons=always --color=always --group-directories-first'
abbr -a -- ll 'eza --icons=always --color=always --group-directories-first -hl'
abbr -a -- lL 'eza --icons=always --color=always --group-directories-first -ahl'
abbr -a -- ls 'eza --icons=always --color=always --group-directories-first'
abbr -a -- La 'eza -a --color=always --group-directories-first'
abbr -a -- Ls 'eza --color=always --group-directories-first'
abbr -a -- Ll 'eza --color=always --group-directories-first -hl'
abbr -a -- LL 'eza --color=always --group-directories-first -ahl'
abbr -a -- T1 'eza --tree --color=always --level=1'
abbr -a -- T2 'eza --tree --color=always --level=2'
abbr -a -- T3 'eza --tree --color=always --level=3'
abbr -a -- t1 'eza --icons=always --tree --color=always --level=1'
abbr -a -- t2 'eza --icons=always --tree --color=always --level=2'
abbr -a -- t3 'eza --icons=always --tree --color=always --level=3'
abbr -a -- lvim 'NVIM_APPNAME=lvim nvim'
starship init fish | source
zoxide init fish | source
tv init fish | source

# thefuck --alias | source
# catnap

set -gx FZF_DEFAULT_OPTS "\
--color=bg+:#414559,bg:#303446,spinner:#F2D5CF,hl:#E78284 \
--color=fg:#C6D0F5,header:#E78284,info:#CA9EE6,pointer:#F2D5CF \
--color=marker:#BABBF1,fg+:#C6D0F5,prompt:#CA9EE6,hl+:#E78284 \
--color=selected-bg:#51576D \
--color=border:#737994,label:#C6D0F5"

fnm env --use-on-cd --shell fish | source
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
