#//                    ██
#//                   ░██
#//     ██████  ██████░██
#//    ░░░░██  ██░░░░ ░██████
#//       ██  ░░█████ ░██░░░██
#//      ██    ░░░░░██░██  ░██
#//     ██████ ██████ ░██  ░██
#//    ░░░░░░ ░░░░░░  ░░   ░░

#// ------------------------------------------------
#// .zshrc
#// ------------------------------------------------
# Debug flag
# export DEBUG=1

#// ------------------------------------------------
#// shell variables
#// ------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/.cache/zsh/.zcompdump-$HOST

ZSH_DISABLE_COMPFIX="true"
CASE_SENSITIVE="true"

# ZSH Themes https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="gentoo"
ZSH_THEME="minimal"
#ZSH_THEME="eastwood"
#ZSH_THEME="imajes"

# Which plugins would you like to load?
plugins=(
  themes
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# export LANG=en_US.UTF-8
# export ARCHFLAGS="-arch x86_64"
export KEYTIMEOUT=1
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
# export MANPATH="/usr/local/man:$MANPATH"
export HOMEBREW_FORCE_BREWED_CURL
export HOMEBREW_NO_ENV_HINTS=true
export EDITOR="nvim"

source $ZSH/oh-my-zsh.sh

#// ssh-agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

#//-------------------------------------------------
#// aliases and functions
#//-------------------------------------------------

#// general
alias c='clear'
alias k='clear'
alias cls='clear'
alias qq='exit'

alias vimrc='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc'
alias reload='source ~/.zshrc'

#// shell history
alias h='history'

#// super user
alias _='sudo '
alias root='sudo su -'

#// directory navigation
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

#// chmod and permissions commands
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'

#// directory
alias md='mkdir -p'
alias l='LC_COLLATE=C ls -CF'
alias ll='LC_COLLATE=C ls -ahlFi'
alias la='LC_COLLATE=C ls -A'
alias lsd='LC_COLLATE=C ls -l | grep "^d"'

#// copy/move/delete
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmd='rm -rf'

#// open
#alias open='xdg-open'

#// grep
#alias grep='grep --color=always'
#alias egrep='egrep --color=always'

#// cheat.sh
function cheat() {
 curl cheat.sh/$1
}

#// ssh
alias ssh-keygen='ssh-keygen -t ed25519 -C "@$(hostname)"'
alias ssh-agent="eval `ssh-agent`"
alias ssh-add="ssh-add --apple-use-keychain ~/.ssh/*_id"

#// cli search
alias '?'='google.sh'
alias '?ddg'='duck.sh'

#// maintenance
alias rmds='find . -name '.DS_Store' -type f -delete'

#// misc
alias iplocal='ipconfig getifaddr en0' #// macOS only
alias ipinfo='curl ipinfo.io'
alias ping='ping -c 10'
alias whois='whois -H'
alias weather='curl wttr.in'
alias netaudit='sudo nmap -sT -O localhost'

#// composer
alias composer='php /usr/local/bin/composer.phar'

#// python
#alias python='/usr/local/bin/python3'
#alias pip='/usr/local/bin/pip3'

#// tmux
alias tx='tmux'
alias txa='tmux a'
alias txl='tmux ls'
alias txn='tmux new -s'

#// vim
alias v='nvim'
alias nv='nvim'

#// homebrew
alias bup='brew update && brew upgrade'
alias bupc='brew update && brew upgrade && brew cleanup'
alias bout='brew outdated'
alias bin='brew install'
alias brm='brew uninstall'
alias bcl='brew cleanup'
alias bls='brew list'
alias 'b?'='brew search'
alias binf='brew info'
alias bdr='brew doctor'
alias bed='brew edit'

#// homebrew cask
alias bcup='brew upgrade --cask --greedy'
alias bcin='brew --cask install'
alias bcrm='brew --cask uninstall'
alias bczp='brew --cask zap'
alias bccl='brew --cask cleanup'
alias bcsr='brew --cask search'
alias bcls='brew --cask list'
alias bcinf='brew --cask info'
alias bcdr='brew --cask doctor'
alias bced='brew --cask edit'

#// pacman
# alias pup='sudo pacman -Syyu'
# alias pin='sudo pacman -S'
# alias prm='sudo pacman -R'
# alias pcl='sudo pacman -Sc'
# alias pls='sudo pacman -Qe'

#// AUR via yay
# alias yup='yay -U'
# alias yin='yay -S'
# alias yrm='yay -R'

#// git
alias g='git'
alias gs='git status'
alias gst='git status -sb --ignore-submodules'
alias ga='git add'
alias gca='git commit -a -m'
alias gcm='git commit -m'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -D'
alias gcob='git checkout -b'
alias gco='git checkout'
alias gdc='git diff --cached'
alias gd='git diff'
alias gm='git merge --no-ff'
alias gpt='git push --tags'
alias gp='git push'
alias undopush='git push -f origin HEAD^:master'
alias gpom='git pull origin master'
alias grs='git reset --soft'
alias grh='git reset --hard'
alias gcp='git cherry-pick'
alias gl='git lg'

#// yarn
alias y='yarn'
alias yi='yarn install'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yrm='yarn remove'
alias yint='yarn init'

#// npm
alias ni='npm install'
alias nis='npm install --save'
alias nid='npm install --save-dev'
#alias nit='npm install-test'
#alias nits='npm install-test --save'
#alias nitd='npm install-test --save-dev'
alias nu='npm uninstall'
#alias nus='npm uninstall --save'
#alias nud='npm uninstall --save-dev'
#alias np='npm publish'
#alias nup='npm unpublish'
#alias nlk='npm link'
#alias nod='npm outdated'
#alias nrb='npm rebuild'
#alias nud='npm update'
alias nr='npm run'
alias nls='npm list'
alias nlsg='npm list --global'

#// postgres
alias pg.start='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias pg.stop='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'

#// mysql
alias mysql.start='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
alias mysql.stop='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'

#// local servers
#// nginx (linux)
#alias nginx.enable='sudo systemctl enable nginx.service'
#alias nginx.start='sudo systemctl start nginx.service'
#alias nginx.stop='sudo systemctl stop nginx.service'
#alias nginx.restart='nginx.stop; and nginx.start'
#alias nginx.conf='sudo nvim /etc/nginx/nginx.conf'

#// nginx logs
#alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
#alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
#alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
#alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'
#alias nginx.logs.phpmyadmin.access='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.access.log'⏎

#// mutt
alias mutt='neomutt'
alias email='neomutt'

#// irc
alias irc='irssi'

#// reddit
alias reddit='rtv'

#// vps
source /Users/void/.dotfiles/.zsh-vps

#// fun stuff
#alias stfu='osascript -e "set volume output muted true"'
#alias hax='growlnotify -a "Activity Monitor" "System error" -m "hey noob idiot bitch t(._.t)"'
alias cmatrix='cmatrix -s -b -u 10'

#// games
alias quake='quakespasm'

#// rbenv
eval "$(rbenv init -)"

#// pyenv
eval "$(pyenv init -)"

#// django
alias dja='django-admin'

#// nvm
export NVM_DIR="$HOME/.nvm"
alias loadnvm='[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"'  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
loadnvm

#// docker
#function livetag { git tag live-$(date +"%s") && git push origin --tags }
#function dkill { docker system prune -f && docker kill $(docker ps -q) && docker system prune -f }
# WSL Only
# if [ "$(uname 2> /dev/null)" = "Linux" ]; then
#   export DOCKER_HOST=localhost:2375
# fi

#// google cloud
#source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
#source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
# export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"

#// banner
clear
echo " "
echo This is ZSH $ZSH_VERSION
echo ;date ;uptime
echo " "
echo $(hostname) | figlet -f larry3d
echo " "
fortune -e
echo " "

#// ------------------------------------------------
#// path
#// ------------------------------------------------
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:$(yarn global bin):$HOME/.local/bin:/usr/local/opt/php/bin:/usr/local/opt/curl/bin:/usr/local/opt/llvm/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$HOME/.pyenv/shims:$HOME/.dotfiles/scripts:$HOME/_dotfiles/scripts"
export PATH="$HOME/.bin:$PATH"
