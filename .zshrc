# ~/.zshrc — interactive shell configuration

# ── Guard: only run for interactive shells ──
case $- in
    *i*) ;;
      *) return;;
esac

bindkey -e
setopt autocd
setopt APPEND_HISTORY
setopt SHARE_HISTORY

HISTFILE="$HOME/.histfile"
HISTSIZE=3000
SAVEHIST=3000
export HISTORY_IGNORE="(cd|cd -|cd ..|pwd|ls|exit)"

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'

NEWLINE=$'\n'
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f${NEWLINE}%(?..%F{red}%?%f )%F{green}❯%f '

autoload -Uz select-word-style
select-word-style bash

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

export EDITOR=vim

[ -f "$HOME/.config/shell/alias.sh" ] && . "$HOME/.config/shell/alias.sh"

. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
