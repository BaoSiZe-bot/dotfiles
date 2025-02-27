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
$env.config.buffer_editor = "hx"
$env.config.show_banner = false
$env.config.edit_mode = 'vi'
$env.MYVIMDIR = ".vim"
$env.SHELL = "nu"
use std/util "path add"
path add "~/.local/bin"
path add "~/.cargo/bin"
path add "~/.bin"
alias fd = fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | fzy -l 20
alias Z = cd (fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=d | fzy -l 20)
alias oe = xdg-open (fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | fzy -l 20)
alias ee = hx (fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | fzy -l 20)
# alias hs = fzy -l 20 -q (history)
alias p = paru
alias ps = paru -S
alias pl = paru -Ql
alias pr = paru -R' #To remove a package and its dependencies
alias pR = paru -Rs' #To remove a package and its dependencies
alias pq = paru -Qs' #To search for already installed packages
alias pi = paru -Qi' #To display information about locally installed packages
alias par = paru -c'  # remove orphaned packages
alias pc = paru -Scc' #removing old packages from cache
alias a = aptitude
alias as = sudo aptitude install
alias al = apt list --installed
alias ar = sudo apt remove --purge
alias aR = sudo aptitude remove --purge-unused' #aptitude will remove package's dependencies automatically
alias aq = apt list --installed | rg ""
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

# Directories
const alt_c = {
    name: fzf_dirs
    modifier: alt
    keycode: char_c
    mode: [emacs, vi_normal, vi_insert]
    event: [
      {
        send: executehostcommand
        cmd: "
          let fzf_alt_c_command = \$\"fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=d | fzy -l 20 \";
          let result = nu -c $fzf_alt_c_command;
          cd $result;
        "
      }
    ]
}

# History
const ctrl_r = {
  name: history_menu
  modifier: control
  keycode: char_r
  mode: [emacs, vi_insert, vi_normal]
  event: [
    {
      send: executehostcommand
      cmd: "
        let result = history
          | get command
          | str replace --all (char newline) ' '
          | to text
          | fzy -l 20;
        commandline edit --append $result;
        commandline set-cursor --end
      "
    }
  ]
}

# Files
const ctrl_t =  {
    name: fzf_files
    modifier: control
    keycode: char_t
    mode: [emacs, vi_normal, vi_insert]
    event: [
      {
        send: executehostcommand
        cmd: "
          let fzf_ctrl_t_command = \$\"fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | fzy -l 20\";
          let result = nu -c $fzf_ctrl_t_command;
          commandline edit --append $result;
          commandline set-cursor --end
        "
      }
    ]
}

# Update the $env.config
export-env {
  if not ($env.__keybindings_loaded? | default false) {
    $env.__keybindings_loaded = true
    $env.config.keybindings = $env.config.keybindings | append [
      $alt_c
      $ctrl_r
      $ctrl_t
    ]
  }
}
catnap
