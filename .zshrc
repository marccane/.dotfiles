###########
#REMEMBER not to use relative paths when referencing files so a config reload can be done from anywhere!
###########

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd
bindkey -e

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "5C" forward-word
bindkey "5D" backward-word
bindkey "^H" backward-delete-word
bindkey "5~" kill-word
bindkey "6~" kill-line
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "~/.zshrc"

#PROMPT='%m:%1~ %n%#'

#TODO: only execute if they exist
source ~/.aliases
source ~/.aliases_private

#Auto-color stderr in red
#src: https://serverfault.com/a/570651
#exec 9>&2
#exec 8> >(
#    while IFS='' read -r line || [ -n "$line" ]; do
#       echo -e "\033[31m${line}\033[0m"
#    done
#)
#function undirect(){ exec 2>&9; }
#function redirect(){ exec 2>&8; }
#trap "redirect;" DEBUG
#PROMPT_COMMAND='undirect;'
#end auto-color

autoload -Uz compinit
compinit
# End of lines added by compinstall
neofetch
PATH=$(pyenv root)/shims:$PATH
