# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ian"
DISABLE_LS_COLORS="true"
plugins=(zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

addpath() {
  export PATH="$1:$PATH"
}

unsetopt HIST_VERIFY
setopt extendedglob

export PATH="/sbin"
addpath "/bin"
addpath "/usr/sbin"
addpath "/usr/bin"
addpath "/usr/local/sbin"
addpath "/usr/local/bin"
addpath "/usr/local/share/npm/bin"
addpath "$HOME/.rvm/bin"
addpath "$HOME/Applications/ghc-7.10.1.app/Contents/bin"
addpath "$HOME/.cabal/bin"
addpath "$HOME/.gem/ruby/2.2.0/bins"
addpath "$HOME/.cask/bin"
addpath "$HOME/bin"
addpath "$HOME/src/httprintf/scripts"
addpath "$HOME/src/hs/bin"
addpath "/Library/TeX/Distributions/Programs/texbin"

export VISUAL="subl -w"

rvm="$HOME/.rvm/scripts/rvm"
[[ -s "$rvm" ]] && source "$rvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

alias ls="ls -Fx"
alias ll="ls -lAh"
alias la="ls -A"
alias subl.='subl .'
alias xcode='open *.xcworkspace'
alias emacs='open -a Emacs'
alias s='source ~/.zshrc'
alias c='cabal install -j --only-dependencies --enable-tests'
alias d='terminal-notifier -message "done"'
alias ped='perl -pe'

fix() {
  git commit $@ --fixup "$(git log --oneline --topo-order --decorate -n30 | fzf --reverse | awk '{print $1}')"
}

sd() {
  git diff "$@" > /tmp/git.diff
  subl /tmp/git.diff
}

sdc() {
  git diff --cached "$@" > /tmp/git.diff
  subl /tmp/git.diff
}

jf() {
  pbpaste | jq '.' | pbcopy
}

"="() {
  echo "$@" | bc
}
