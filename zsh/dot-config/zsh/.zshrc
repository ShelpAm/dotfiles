################################################################################
# ShelpAm's CONFIG BEGIN
source "${ZDOTDIR}/utils.zsh"
source "${ZDOTDIR}/aliases.zsh"
source "${ZDOTDIR}/proxy.zsh"
# ShelpAm's CONFIG END 
################################################################################

ZINIT_BIN_DIR="${XDG_DATA_HOME}/zinit/zinit.git"
ensure_parent_dir "${ZINIT_BIN_DIR}"
[ ! -d $ZINIT_BIN_DIR/.git ] && git clone https://github.com/zdharma-continuum/zinit.git $ZINIT_BIN_DIR
typeset -A ZINIT           # Initial Zinit's hash definition
source $ZINIT_BIN_DIR/zinit.zsh

## History
HISTSIZE=100000000
SAVEHIST=${HISTSIZE}
HISTFILE="${XDG_STATE_HOME}/zsh/history"
ensure_parent_dir "${HISTFILE}"
setopt EXTENDED_HISTORY
setopt HIST_VERIFY          # Reload results of history expansion before executing
# setopt HIST_IGNORE_ALL_DUPS # Do not enter duplicates into history
setopt HIST_IGNORE_DUPS # Remove continuous duplicates
setopt HIST_IGNORE_SPACE    # Ignore command lines with leading spaces
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY   # Append the history list to the history file, rather than replace it.
# setopt SHARE_HISTORY        # Constantly share history between shell instances

setopt NO_BEEP
# setopt AUTO_CD
# setopt CD_ABLE_VARS
# setopt CORRECT

setopt INTERACTIVE_COMMENTS # Allow comments in interactive mode

setopt ZLE                  # Use the zsh line editor.
bindkey -v                  # Enable vi mode for (i don't even know :()

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# Use `z` to jump anywhere!
zinit load agkozak/zsh-z

zinit snippet OMZL::functions.zsh
# zinit snippet OMZP::web-search
zinit snippet OMZP::sudo

# Use modern completion system
autoload -Uz compinit && compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME}/zsh/zcompcache"
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# # Theme
# zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
# zinit light sindresorhus/pure
# print() {
#   [ 0 -eq $# -a "prompt_pure_precmd" = "${funcstack[-1]}" ] || builtin print "$@";
# }
# fpath+=($HOME/.local/share/zinit/plugins/sindresorhus---pure/)
# autoload -U promptinit && promptinit
# # PURE_PROMPT_SYMBOL="%#"
# PURE_CMD_MAX_EXEC_TIME=10
# PURE_POWER_MODE=fancy
# zstyle :prompt:pure:path color green
# zstyle ':prompt:pure:prompt:*' color cyan # change the color for both `prompt:success` and `prompt:error`
# zstyle :prompt:pure:git:stash show yes # turn on git stash status
# zstyle :prompt:pure:user show yes
# prompt pure

ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)

# Theme, starship
eval "$(starship init zsh)"

 # Start ssh-agent for every session, as it saves ssh passphrase for us.
# eval "$(ssh-agent)"
# ssh-add
#
#  Not using it because each time I started a sessino, it prompts to ask for
# passphrass, which is annoying especially when I don't want to use ssh-related
# features

# Work with tmux:'ofirgall/tmux-window-name'
tmux-window-name() {
	($TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py &)
}
add-zsh-hook chpwd tmux-window-name

fix-tmux-env () {
    eval $(tmux show-env -s |grep '^SSH_')
}
