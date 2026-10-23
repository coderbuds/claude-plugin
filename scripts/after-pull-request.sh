#!/bin/sh
# Runs after a pull request is opened. Sends nothing anywhere: it only adds one
# sentence to Claude's context, so the AI usage report is made while the pull
# request number is in front of it.
cat > /dev/null

printf '%s\n' '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"Coderbuds plugin: a pull request was opened. In a repository the team tracks in Coderbuds, the report-ai-usage skill records how much of it an agent wrote, using this pull request number."}}'
