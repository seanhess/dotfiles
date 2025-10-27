#!/usr/bin/env bash
# Usage: codex-notify.sh '<JSON string from Codex>'
# Pipe argv[1] to the Shortcut as stdin.
# If Codex ever calls without an arg, just exit quietly.

if [ $# -eq 0 ]; then
  echo "No Input"
  exit 1
fi

# Send the JSON (exactly) to Shortcuts via stdin
printf '%s' "$1" | shortcuts run "Codex"
