PATH=$PATH:/Applications/VMware\ OVF\ Tool:/Users/khord/scripts/path:/usr/local/opt/avr-gcc@7/bin:/$GOPATH/bin

export TERM="xterm-256color"
export ZSH="/Users/khord/.oh-my-zsh"
export HISTCONTROL=ignorespace
export GOPATH="/Users/khord/go"
export MPLBACKEND="module://itermplot"
export ITERMPLOT=rv
export REPORTTIME=2
export KUBE_EDITOR="vim"

ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="agnoster"
#ZSH_THEME="pygmalion"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' file-sort date

DEFAULT_USER="khord"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_TIME_BACKGROUND='grey50'
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

alias .z=". ~/.zshrc"
alias 1p='eval $(op signin simspace)'
alias 1plaptop='echo -n $(op get item AD --fields laptop) | pbcopy'
alias 1psudo='echo -n $(op get item AD --fields laptop) | sudo -S true'
alias bbd="(cd /Users/khord/dotfiles && exec brew bundle dump --force)"
alias boo="imgcat ~/Pictures/emojis/128px/boo-icon-128px.png"
alias h="history"
alias lk="open -a ScreenSaverEngine"
alias mntbucket='open "smb://khord@bucket/data_share"'
alias myip='extip=$(dig +short myip.opendns.com @resolver1.opendns.com); if [ -z "$extip" ]; then echo "n/a"; else echo $extip && whois $extip | awk '\''/Organization|org-name|descr/ {$1=""; print substr($0,2)}'\''; fi'
alias notes="vim ~/Documents/notes"
alias simspace="imgcat ~/Pictures/emojis/128px/Light-Blue-128px.png"
alias slp="pmset sleepnow"
alias superscript="node ~/dotfiles/scripts/js/superscript.js"
alias vundle="vim +PluginInstall +qall"
alias wol="wakeonlan"
flyfi-stats() { curl -s http://www.flyfi.com/travel/ | awk '/flightAltitude|flightSpeed/ {print $2}' | tr -d "</span></li>" }
k8s-conf() { export KUBECONFIG="${HOME}/.kube/config-kubes-$1"; kubectl config set-context --current --namespace=simspace-portal-appliance }
k8s-psql() { kubectl exec -it $(kubectl get pod -l kind=postgres -o=jsonpath='{.items[0].metadata.name}') -- psql -U range-data-server -d range-data-server }
mgmtagents() { ssh -t root@$1 "/etc/init.d/hostd restart; /etc/init.d/vpxa restart" }
newsvg() { echo '<?xml version="1.0" encoding="utf-8"?>' >> $1; }
verylegit() { url="$(curl -s verylegit.link/sketchify -d long_url=$1)"; echo "$url copied to clipboard"; echo $url | pbcopy }
whoorg() { whois $1 | awk '/Organization|org-name|descr|CustName|NetName|Customer|OrgTechName/ {$1=""; print substr($0,2)}' | sort -u }

# opam configuration
test -r /Users/khord/.opam/opam-init/init.zsh && . /Users/khord/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
