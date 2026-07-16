# ---------------------------
# EXIT IF NOT INTERACTIVE
# ---------------------------
[[ $- != *i* ]] && return

# ---------------------------
# PATH
# ---------------------------
export PATH="$HOME/.npm-global/bin:$PATH"

# ---------------------------
# HISTORY
# ---------------------------
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

# ---------------------------
# COMPLETION
# ---------------------------
autoload -Uz compinit
compinit
setopt AUTO_MENU COMPLETE_IN_WORD
zstyle ':completion:*' menu select=2

# ---------------------------
# SMART HISTORY SEARCH (↑ ↓)
# ---------------------------
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# ---------------------------
# AUTOSUGGESTIONS
# ---------------------------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#---------------------------- 
# Syntax Highlight
# --------------------------- 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---------------------------
# ALIASES
# ---------------------------
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tty-clock='tty-clock -c -s -b -C 6'
alias hyprconf='nvim ~/.config/hypr/hyprland.conf'
alias ff='fastfetch --config ~/.config/fastfetch/current.jsonc'
alias v='nvim'
alias aion="cd ~/repos/odysseus && docker compose up -d"
alias aioff="cd ~/repos/odysseus && docker compose down"
alias s="pacman -S"
alias r="pacman -Rns"
alias ss="pacman -Ss"
alias nm="hyprsunset --gamma_max 200% --temperature 5000 & disown"
alias nmn="hyprsunset -i"
#Dotsave Function
dotsave() {
    cd ~/dotfiles || return

    echo
    git status --short
    echo

    echo -n "Commit message: "
    read msg

    [ -z "$msg" ] && echo "Aborted." && return

    git add .
    git commit -m "$msg"
    git push
}

# ---------------------------
# STARSHIP
# ---------------------------
eval "$(starship init zsh)"

# ---------------------------
# AUTOSTART
# ---------------------------
#fastfetch


#Alias for backlight
alias on='/usr/local/bin//backlight.sh on'
alias off='/usr/local/bin//backlight.sh off'
