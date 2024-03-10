if status is-interactive
    # Commands to run in interactive sessions can go here
end
set --universal fish_greeting

export NVIM_APPNAME=nvchad
# alias vim=nvim
alias vim="export NVIM_APPNAME=nvchad & nvim"
# alias lazy="export NVIM_APPNAME=lazyvim & nvim"
alias astro="export NVIM_APPNAME=astronvim & nvim"
# alias nv3="export NVIM_APPNAME=nv3 & nvim"
# alias vvim="export NVIM_APPNAME= & nvim" # vanilila vim
# alias nvtest="export NVIM_APPNAME=test & nvim" # nvchad starter branch
alias nv2="export NVIM_APPNAME=nvchad_v2.0 & nvim" # nvchad starter branch
alias pkl="~/pkl"
alias cls=clear
alias ls="exa --long --icons --git"

# Scripts

# z directory jumper
zoxide init fish | source
#
bind \cl forward-word
bind \ch backward-word

starship init fish | source
