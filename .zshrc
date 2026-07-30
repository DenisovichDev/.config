# Set up the prompt 
autoload -Uz vcs_info 

export COLORTERM=truecolor
export EDITOR="/home/rishi/.local/bin/nvim"
export VISUAL="/home/rishi/.local/bin/nvim"

zstyle ':vcs_info:*' enable git 
zstyle ':vcs_info:git:*' formats ' %F{121}[%b]%f' 

build_prompt() { 
    local exit_code=$? 
    local prompt_status 

    if (( exit_code == 0 )); then 
        prompt_status="%F{229}[OK]%f" 
    else 
        prompt_status="%F{1}[NOTOK]%f" 
    fi 

    vcs_info 
    PROMPT="${prompt_status} %F{208}Ri%f%F{209}s%f%F{215}h%f%F{221}i@%f%F{222}U%f%F{221}b%f%F{215}un%f%F{209}t%f%F{208}u%f %F{230}%1c%f%F{110} λ%f " 
    RPROMPT="${vcs_info_msg_0_}" 
} 

precmd() { 
    build_prompt 
}


# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# History tuning
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

setopt EXTENDED_GLOB

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search


# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle ':completion:*' rehash true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# LS_COLORS
# https://geoff.greer.fm/lscolors/
export LS_COLORS="di=36:ln=35:so=1;31:pi=32:ex=1;37:bd=1;34:cd=1;34:su=1;37;44:sg=1;37;44:tw=1;36:ow=1;36"
# Color in the file completion list
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Aliases
alias ls='ls -F --color=auto'
alias repo='cd /mnt/c/Local/Work/Repos/'
alias cdd='cd /mnt/c/Local/'
alias exp='Explorer.exe'
alias vrc='$EDITOR ~/.vimrc'
alias nrc='$EDITOR ~/.config/nvim'
alias zrc='$EDITOR ~/.zshrc'
alias ll='ls -lh'
alias la='ls -lAh'

# ZSH Syntax Highlighting 
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.scripts/:$PATH"

if [[ -f ~/.scripts/rishifetch && -z "$NVIM" ]]; then
    ~/.scripts/rishifetch
fi


export PATH="$HOME/.local/bin:$PATH"
