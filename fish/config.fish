if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /Users/archsinit/.rustup/toolchains/stable-x86_64-apple-darwin/bin

# exa - ls replacement
alias l="exa --sort Name"
alias ls="exa --sort Name"
alias ll="exa --sort Name --long"
alias la="exa --sort Name --long --all"
alias lr="exa --sort Name --long --recurse"
alias lra="exa --sort Name --long --recurse --all"
alias lt="exa --sort Name --long --tree --recurse --level=3"
alias lta="exa --sort Name --long --tree --all --recurse --level=3"

# default text editor: neovim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias ev="nvim ~/.config/nvim/init.lua"
alias sv="source ~/.config/nvim/init.lua"

# git aliases
alias gss="git status -s"
alias gpl="git pull"
alias gad="git add ."
alias gps="git push origin main"
alias gcm="git commit -m"
