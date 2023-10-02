if status is-interactive
    # Commands to run in interactive sessions can go here
end
# Envs
export NVIM_APPNAME=nvchad
alias cls=clear
alias vim=nvim
alias ls="exa --long --icons --git"
# Scripts
alias changeTheme="~/scripts/changeTheme.sh"
alias kts="~/scripts/kts.sh"
bind \cl 'forward-word'
bind \ch 'backward-word'

starship init fish | source
