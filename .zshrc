# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

autoload -Uz compinit && compinit

export FZF_BASE=/usr/share/fzf

# See https://github.com/zsh-users/zsh-autosuggestions/issues/570#issuecomment-833938418
SPACESHIP_CHAR_PREFIX='%{%G%G'
SPACESHIP_CHAR_SUFFIX='%}'
export SPACESHIP_CONFIG="$HOME/.dotfiles/spaceship.zsh"

[[ -e ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# Source antidote.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# Initialize antidote's dynamic mode, which changes `antidote bundle`
# from static mode.
source <(antidote init)

# Bundle oh-my-zsh libs and plugins with the 'path:' annotation
if [ -d $FZF_BASE ]; then
	antidote bundle ohmyzsh/ohmyzsh path:plugins/fzf
	antidote bundle Aloxaf/fzf-tab
fi
antidote bundle ohmyzsh/ohmyzsh path:lib
antidote bundle ohmyzsh/ohmyzsh path:plugins/git
antidote bundle ohmyzsh/ohmyzsh path:plugins/pip
antidote bundle ohmyzsh/ohmyzsh path:plugins/colored-man-pages
antidote bundle ohmyzsh/ohmyzsh path:plugins/command-not-found
antidote bundle ohmyzsh/ohmyzsh path:plugins/docker
antidote bundle ohmyzsh/ohmyzsh path:plugins/systemd
antidote bundle zsh-users/zsh-syntax-highlighting
antidote bundle zsh-users/zsh-autosuggestions
antidote bundle zsh-users/zsh-completions
antidote bundle desyncr/auto-ls

antidote bundle spaceship-prompt/spaceship-prompt

# Preferred editor for local and remote sessions
export EDITOR='vim'

alias ll='ls -l -A -p --color=auto -h'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias py="python3"
alias dc='docker-compose'
alias gpt='ddo'

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain
export TERM=xterm-256color

# User scripts and python executables.
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin"

if [ -f "$HOME/.zshrc-local" ]; then
	source $HOME/.zshrc-local
fi
