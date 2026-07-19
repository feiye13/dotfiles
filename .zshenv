# ~/.zshenv — sourced by ALL zsh instances; keep it minimal (env vars only)
typeset -U path PATH
path=("$HOME/.local/bin" $path)
export PATH
