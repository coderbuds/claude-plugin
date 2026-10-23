#!/bin/sh
# Runs after `git push`. Sends nothing anywhere: it only adds one sentence to
# Claude's context, so the fit check happens while the pull request is still
# unopened rather than after it.
cat > /dev/null

printf '%s\n' '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"Coderbuds plugin: a branch was pushed. When a pull request is about to be opened from it in a repository the team tracks in Coderbuds, the check-change-fit skill compares the diff with the team'"'"'s own merged pull requests first."}}'
