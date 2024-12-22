#!/bin/bash

SESSION_NAME="general_session"

# Check if the session already exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Session $SESSION_NAME already exists. Attaching to it."
    tmux attach-session -t $SESSION_NAME
else
    # Create a new session and name it
    tmux new-session -d -s $SESSION_NAME

    # Split the window horizontally
    tmux split-window -h

    # Create a new window
    tmux new-window

    # Attach to the created session
    tmux attach-session -t $SESSION_NAME:0.0
fi
