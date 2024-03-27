if status is-interactive
    # Commands to run in interactive sessions can go here
end
set --universal fish_greeting

# Aliases
alias vim="export NVIM_APPNAME=nvim & nvim"
alias lazy="export NVIM_APPNAME=lazyvim & nvim"
alias astro="export NVIM_APPNAME=astronvim & nvim"
alias vvim="export NVIM_APPNAME=VANILLA & nvim" # vanilla vim
alias cls=clear
alias ls="exa --long --icons --git"

# Env Variables
export NVIM_APPNAME=nvchad

# Keybindings
bind \el forward-word
bind \eh backward-word

# Initialize integrations
zoxide init fish | source
starship init fish | source
