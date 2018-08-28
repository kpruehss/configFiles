# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="xiong-chiamiov-plus"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/home/kartug/.ZSH-CUSTOM/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast git-extras jsontools archlinux sudo pyenv python npm web-search systemd)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# NPM
export PATH=$HOME/.npm/bin:$PATH
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Basic Aliases
alias pycase="mtlower.sh"
alias cupdate="cower -udf"
alias p7z="7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on"
alias v="nvim"
alias sv="sudo vim"
alias ls="ls --color=auto --group-directories-first"
alias b="cd .. && ls -a"
alias q="exit"
alias e="exit"
alias l="ls -lFh"
alias la="ls -AFh"
alias vim='nocorrect nvim'

#Term only
alias mute="pamixer -m"
alias vd="pamixer -d 10"
alias vu="pamixer -i 10"
alias p="mocp -G &> /dev/null"
alias next="mocp -f &> /dev/null"
alias prev="mocp -r &> /dev/null"
alias mnt="sudo bash ~/.config/Scripts/mount.sh"
alias umnt="sudo bash ~/.config/Scripts/unmount.sh"
alias newnet="sudo systemctl restart NetworkManager"

#etc
alias yt="youtube-dl -ic"
alias yta="youtube-dl -xic"
alias youtube="youtube-viewer"
alias YT="youtube-viewer"
alias syt="youtube-viewer"

#Navigation
alias h="cd ~ && lsa"
alias cf="cd ~/.config && lsa"
alias d="cd ~/Documents && lsa"
alias p="cd ~/Documents/Properties && lsa"
alias D="cd ~/Downloads && lsa"
alias pp="cd ~/Pictures && lsa"
alias pw="cd ~/Pictures/Wallpapers && lsa"
alias vv="cd ~/Videos && lsa"
alias m="cd ~/Music && lsa"
alias dev="cd ~/Devel && lsa"
alias cfb="vim ~/.config/Scripts/bashrc"
alias cfz="vim ~/.zshrc"
alias cfv="vim ~/.config/nvim/init.vim"
alias cfr="vim ~/.config/ranger/rc.conf.base"
alias cfi="vim ~/.config/i3/config"
alias cfq="vim ~/.config/qutebrowser/keys.conf.base"
alias cfQ="vim ~/.config/qutebrowser/qutebrowser.conf"
alias cfm="vim ~/.config/mutt/muttrc"
alias cfM="vim ~/.moc/keymap"
alias cff="vim ~/.config/Scripts/folders"
alias cfc="vim ~/.config/Scripts/configs"
alias cft="vim ~/.config/termite/config"
alias cfT="vim ~/.tmux.conf"
alias cfg="vim ~/.config/mutt/gmail.conf"
alias cfC="vim ~/.config/mutt/cock.conf"
alias cfa="vim ~/.config/mutt/aliases"
alias mv="mv -v"
alias cp="cp -v"
#Misc config
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:~/bin
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zstyle ':completion:*' rehash true
neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
