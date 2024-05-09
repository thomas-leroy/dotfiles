# Set up the color scheme for 'ls' when using the '-G' flag. 'exfxcxdxbxegedabagacad' defines specific colors for various file types.
export LSCOLORS="exfxcxdxbxegedabagacad"

# Enable colorized output for the 'ls' command and potentially other CLI tools that respect this variable.
export CLICOLOR=true

# Extend the function path with custom functions from $ZSH/functions directory. This allows ZSH to load additional user-defined functions.
fpath=($ZSH/functions $fpath)

# Set the location of the ZSH command history file.
HISTFILE=~/.zsh_history

# Set the maximum number of entries to store in the history file.
HISTSIZE=10000

# Set the maximum number of commands to save in the in-memory command history.
SAVEHIST=10000

# Prevent ZSH from lowering the priority of background tasks. This keeps background jobs running at normal priority.
setopt NO_BG_NICE

# Do not terminate ZSH when the terminal hangs up (e.g., remote session closed).
setopt NO_HUP

# Disable the beep sound when auto-completion finds no matches.
setopt NO_LIST_BEEP

# Allow each function to have its own local set of options without affecting the global options.
setopt LOCAL_OPTIONS

# Enable functions to define their own signal handlers (traps).
setopt LOCAL_TRAPS

# Before executing a command from history expansion, allow the user to edit it.
setopt HIST_VERIFY

# Share command history between all ZSH sessions, allowing commands entered in one terminal to be accessed in another.
setopt SHARE_HISTORY

# Save each command's execution time and duration in the history file.
setopt EXTENDED_HISTORY

# Allow prompt string to undergo parameter expansion, command substitution, and arithmetic expansion.
setopt PROMPT_SUBST

# Automatically correct minor spelling errors in commands.
setopt CORRECT

# Allow completion to occur within a word. By default, completion works from the end of a word.
setopt COMPLETE_IN_WORD

# Ignore end-of-file marker (Ctrl+D) when entered at the beginning of a line.
setopt IGNORE_EOF

# Append new history lines to the history file rather than overwriting it.
setopt APPEND_HISTORY

# Incrementally append commands to the history file and share across sessions, allowing live session sharing.
setopt INC_APPEND_HISTORY SHARE_HISTORY

# Do not store duplicate commands sequentially in the history.
setopt HIST_IGNORE_ALL_DUPS

# Remove superfluous blanks from each command line for the history file.
setopt HIST_REDUCE_BLANKS

# Ensure that aliases are not expanded when a command line is being auto-completed.
setopt complete_aliases

# Key bindings to navigate words and lines in the shell using the Alt + arrow keys and others for navigation and editing.
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char
