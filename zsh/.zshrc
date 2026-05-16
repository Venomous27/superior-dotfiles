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

# ---------------------------
# ALIASES
# ---------------------------
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tty-clock='tty-clock -c -s -b -C 6'
alias hyprconf='nvim ~/.config/hypr/hyprland.conf'
alias fastfetch='fastfetch --config ~/.config/fastfetch/current.jsonc'
alias resolve='distrobox enter ubuntu -- bash -lc "QT_QPA_PLATFORM=xcb __GL_SYNC_TO_VBLANK=0 /opt/resolve/bin/resolve"'
alias dotsave='cd ~/dotfiles && git add . && git commit -m \"update\" && git push'
# ---------------------------
# STARSHIP
# ---------------------------
eval "$(starship init zsh)"

# ---------------------------
# AUTOSTART
# ---------------------------
fastfetch


