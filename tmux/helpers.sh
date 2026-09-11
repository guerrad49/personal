#!/usr/bin/env bash
# =============================================================================
# tmux helper functions
#
# Called from ~/.tmux.conf via 
#   `run-shell "~/.tmux/helpers.sh <function_name>"`.
# Add new functions below, then dispatch to them in the case block at the
# bottom of this file.
# =============================================================================

# Toggle pane synchronization on/off and flash the borders red while synced.
toggle_sync_panes() {
    local sync_state
    sync_state=$(tmux show-window-options synchronize-panes | awk '{print $2}')
    if [ "$sync_state" = "on" ]; then
        tmux setw synchronize-panes off
        tmux set -g pane-border-style fg=white
        tmux set -g pane-active-border-style fg=colour23
    else
        tmux setw synchronize-panes on
        tmux set -g pane-border-style fg=colour1
        tmux set -g pane-active-border-style fg=colour1
    fi
}

# Print " <branch> " for the git repo at the given pane path, or nothing
# if that path isn't inside a git repo.
git_branch_segment() {
    local pane_path="$1"
    git -C "$pane_path" rev-parse --abbrev-ref HEAD 2>/dev/null \
        | awk '{print " " $0 " "}'
}

# -----------------------------------------------------------------------------
# Dispatcher: run the function named by the first argument
# -----------------------------------------------------------------------------
case "$1" in
    toggle_sync_panes)
        toggle_sync_panes
        ;;
    git_branch_segment)
        git_branch_segment "$2"
        ;;
    *)
        echo "helpers.sh: unknown or missing function '$1'" >&2
        exit 1
        ;;
esac