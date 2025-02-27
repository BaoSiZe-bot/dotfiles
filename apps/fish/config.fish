set fish_greeting
set -gx PATH ~/.bin ~/.local/bin ~/.cargo/bin $PATH
set -gx SHELL fish
set -gx EDITOR nvim
set -gx MYVIMDIR .vim
abbr -a -- c 'clear; catnap'
abbr -a -- fd 'fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | fzy -l 20'
abbr -a -- Z 'cd $(fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=d | fzy -l 20)'
abbr -a -- oe 'xdg-open $(fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | fzy -l 20)'
abbr -a -- ee '$EDITOR $(fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | fzy -l 20)'
abbr -a -- hs 'history | fzy -l 20)'
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
function fzy_key_bindings # edit from fzf

  function __fzy_parse_commandline -d 'Parse the current command line token and return split of existing filepath, fzy query, and optional -option= prefix'
    set -l dir '.'
    set -l query
    set -l commandline (commandline -t | string unescape -n)
    set -l prefix (string match -r -- '^-[^\s=]+=' $commandline)
    set commandline (string replace -- "$prefix" '' $commandline)
    set commandline (string replace -r -- '^~/' '\$HOME/' $commandline)
    set commandline (string escape -n -- $commandline)
    set commandline (string replace -r -a -- '\\\\\$(?=[\w])' '\$' $commandline)
    eval set commandline $commandline
    set commandline (string replace -r -a -- '/+' '/' $commandline)
    if test -n "$commandline"
      set dir (string replace -r -- '(?<!^)/$' '' $commandline)
      while not test -d "$dir"
        set dir (dirname -- $dir)
      end
      if test "$dir" = '.'; and test (string sub -l 2 -- $commandline) != './'
        set fzy_query $commandline
      else
        set fzy_query (string replace -r -- "^$dir/?" '' $commandline)
      end
    end
    string escape -n -- "$dir" "$fzy_query" "$prefix"
  end
  function fzy-file-widget -d "List files and folders"
    set -l commandline (__fzy_parse_commandline)
    set -l prefix $commandline[3]
    if set -l result (eval fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=f | fzy -l 20)
       commandline -t ''
      for i in $result
        commandline -it -- $prefix(string escape -- $i)' '
      end
    end
    commandline -f repaint
  end
  function fzy-history-widget -d "Show command history"
    set -l result (eval builtin history | command perl -0 -pe 's/^/$.\t/g; s/\n/\n\t/gm' | fzy)
    and commandline -- $result
    commandline -f repaint
  end
  function fzy-cd-widget -d "Change directory"
    set -l commandline (__fzy_parse_commandline)
    set -l prefix $commandline[3]
    if set -l result (eval fd -H --no-ignore --no-ignore-parent --no-ignore-vcs -t=d | fzy -l 20)
      cd -- $result
      commandline -rt -- $prefix
    end
    commandline -f repaint
  end
  bind \cr fzy-history-widget
  bind -M insert \cr fzy-history-widget
  bind \ct fzy-file-widget
  bind -M insert \ct fzy-file-widget
  bind \ec fzy-cd-widget
  bind -M insert \ec fzy-cd-widget
end
starship init fish | source
zoxide init fish | source
fzy_key_bindings
catnap
