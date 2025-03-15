set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias vim nvim
alias v nvim
alias g git
alias t tmux
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
alias v nvim
command -qv nvim && alias vim nvim

set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# Установите переменную, указывающую на расположение nvm
set -x NVM_DIR $HOME/.nvm

# Если файл nvm.sh существует, загрузите его через bass (плагин для выполнения bash-скриптов в fish)
if test -f $NVM_DIR/nvm.sh
    bass source $NVM_DIR/nvm.sh --no-use
end


function take
    if test (count $argv) -eq 0
        echo "Usage: tale <directory>"
        return 1
    end
    mkdir -p $argv
    cd $argv
end

