# PATH

export PATH="$HOME/.config/emacs/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

### ALIASES ###

alias l="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"

alias cl="clear"

alias copate="systemctl poweroff"

alias reload_waybar="pkill waybar && waybar & disown"

case ${TERM} in
  Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
    PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')

    ;;
  screen*)
    PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
    ;;
esac

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

### STARSHIP ###
eval "$(starship init bash)"
