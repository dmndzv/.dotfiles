# Aliases
alias ls="ls -la | grep \"^d\" && ls -la | grep -v \"^d\""
alias dit='/usr/bin/git --git-dir=$HOME/.dit/ --work-tree=$HOME'

# ZSH Options
setopt correct            # Auto correct mistakes
setopt extendedglob       # Extended globbing. Allows using regular expressions with *
setopt nocaseglob         # Case insensitive globbing
setopt rcexpandparam      # Array expension with parameters
setopt nocheckjobs        # Don't warn about running processes when exiting
setopt numericglobsort    # Sort filenames numerically when it makes sense
setopt nobeep             # No beep
setopt appendhistory      # Immediately append history instead of overwriting
setopt histignorealldups  # If a new command is a duplicate, remove the older one
setopt autocd             # If only directory path is entered, cd there
setopt inc_append_history # Save commands are added to the history immediately, otherwise only when shell exits
setopt histignorespace    # Don't save commands that start with space
setopt prompt_subst       #
setopt always_to_end      # Move cursor to the end of a completed word
setopt auto_menu          # Show completion menu on a succesive tab press
setopt complete_in_word   # Complete from both ends of a word
unsetopt menu_complete    # Do not autoselect the first completion entry
unsetopt flowcontrol      # Disable start/stop characters in shell editor

# Completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                        # Automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.config/zsh/cache

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/.history

fpath+=~/.config/zsh/.zfunc/_poetry
autoload -Uz compinit
compinit -d ~/.config/zsh/.zcompdump
_comp_options+=(globdots)

# Plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Exports
export GPG_TTY="$(tty)"
export STARSHIP_CONFIG=~/.config/starship.toml
export NVM_DIR="$HOME/.nvm"
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
export PNPM_HOME="/Users/dmndzv/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export PATH="/Users/dmndzv/.local/bin:$PATH"
# export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
# [ -s "/Users/dmndzv/.bun/_bun" ] && source "/Users/dmndzv/.bun/_bun" # bun completions

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/Cellar/pyenv/2.3.15/libexec/pyenv init -)"
eval "$(starship init zsh)"
