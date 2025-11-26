# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

source ~/.config/nushell/themes/catppuccin_frappe.nu
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
# fnm env --use-on-cd --shell  | source
$env.config.buffer_editor = "hx"
$env.config.show_banner = false
$env.config.edit_mode = 'vi'
$env.MYVIMDIR = ".vim"
$env.SHELL = "nu"
use std/util "path add"
path add "~/.local/bin"
path add "~/.cargo/bin"
path add "~/.bin"
path add "~/.config/doomemacs/bin"
path add "~/.local/share/lvim/mason/bin"
path add "/home/linuxbrew/.linuxbrew/bin"
def ff [] { ~/.cargo/bin/fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | fzy -l 20 }
alias Z = cd (ff)
alias oe = xdg-open (ff)
alias ee = nvim (ff)
def hs [] { history | get command | str join "\n" | fzy -l 20 }
alias p = paru
alias ps = paru -S
alias pl = paru -Ql
alias pr = paru -R #To remove a package and its dependencies
alias pR = paru -Rs #To remove a package and its dependencies
alias pq = paru -Qs #To search for already installed packages
alias pi = paru -Qi #To display information about locally installed packages
alias par = paru -c  # remove orphaned packages
alias pc = paru -Scc #removing old packages from cache
alias a = aptitude
alias as = sudo aptitude install
alias al = apt list --installed
alias ar = sudo apt remove --purge
alias aR = sudo aptitude remove --purge-unused #aptitude will remove package's dependencies automatically
alias ai = apt-cache policy
alias aar = sudo apt autoremove
alias ac = sudo rm /var/cache/apt/archives/*
alias au = sudo aptitude update and sudo aptitude upgrade and sudo aptitude full-upgrade
alias kl = sudo rm /var/lib/dpkg/lock-frontend /var/lib/pacman/db.lck
alias la = eza -a --icons=always --color=always --group-directories-first
alias ll = eza --icons=always --color=always --group-directories-first -hl
alias lL = eza --icons=always --color=always --group-directories-first -ahl
alias ls = eza --icons=always --color=always --group-directories-first
alias La = eza -a --color=always --group-directories-first
alias Ls = eza --color=always --group-directories-first
alias Ll = eza --color=always --group-directories-first -hl
alias LL = eza --color=always --group-directories-first -ahl
alias T1 = eza --tree --color=always --level=1
alias T2 = eza --tree --color=always --level=2
alias T3 = eza --tree --color=always --level=3
alias t1 = eza --icons=always --tree --color=always --level=1
alias t2 = eza --icons=always --tree --color=always --level=2
alias t3 = eza --icons=always --tree --color=always --level=3

catnap
