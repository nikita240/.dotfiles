# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export FZF_BASE=/usr/share/fzf

if [ ! -f "$HOME/.antigen.zsh" ]; then
	curl -L git.io/antigen > $HOME/.antigen.zsh
fi
source $HOME/.antigen.zsh

# See https://github.com/zsh-users/zsh-autosuggestions/issues/570#issuecomment-833938418
SPACESHIP_CHAR_PREFIX='%{%G%G'
SPACESHIP_CHAR_SUFFIX='%}'

antigen use ohmyzsh/ohmyzsh

antigen bundle git
antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle pip
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle docker
antigen bundle systemd
antigen bundle desyncr/auto-ls
antigen bundle fzf
antigen theme spaceship-prompt/spaceship-prompt

antigen apply

# Preferred editor for local and remote sessions
export EDITOR='vim'

alias ll='ls -l -A -p --color=auto -h'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias py="python3"
alias dc='docker-compose'

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain
export TERM=xterm-256color

if [ -f "$HOME/.zshrc-local" ]; then
	source $HOME/.zshrc-local
fi
