#!/usr/bin/env bash

# Check if the process is already running
if pgrep $(basename $1); then
  echo "Process is already running."
else
  # Start the process using the command line
  echo "Starting the process..."
  eval "$@"
fi
