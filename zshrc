# files with 600 and dirs with 700.
umask 077

# Control history display.
export HISTFILE=~/.zsh_history
setopt HIST_FIND_NO_DUPS

# Style and color of command prompt.
export PS1="%F{yellow}%m%f %B%F{red}%1~%f%b $ "

# Color palette for terminal.
export CLICOLOR=1
export LSCOLORS=Gxgxcxdxcxxxxxxxxxxxxx

# For birthdays library.
export PYTHONPATH=/Users/david_guerra/Programming/c_cpp/birthdays/install/lib

# Common aliases.
alias ll="ls -l"
alias tmuxgod="tmux -f tmux/tmux.session.conf attach -t Code"
