
#source /opt/Xilinx/14.7/ISE_DS/settings64.sh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.

# Add exports from your profile
source ~/.profile
# set shell
export SHELL=/usr/bin/zsh


POWERLEVEL9K_MODE='nerdfont-complete'
# Use theme
ZSH_THEME="powerlevel10k/powerlevel10k"

export UPDATE_ZSH_DAYS=1

# Enable autocorrection
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  npm
  django
  git 
  zsh-z
  dotenv
  jsontools
  node
  pip
  web-search
  zsh-autosuggestions
  colored-man-pages
  colorize
  common-aliases
  copyfile
)


bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
COMPLETION_WAITING_DOTS=true
DISABLE_UNTRACKED_FILES_DIRTY=true

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize


ZSH_DOTENV_PROMPT=false


# opam configuration
test -r /home/ash/.opam/opam-init/init.zsh && . /home/ash/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
alias config='/usr/bin/git --git-dir=/home/ash/.cfg/ --work-tree=/home/ash'
