---
name: set-up-repository
description: Use when someone asks to set up, connect or wire a repository to Coderbuds, or to roll Coderbuds out to the rest of their team. Fetches the setup steps for this repository's team from Coderbuds and carries them out as one pull request.
---

# Set a repository up for Coderbuds

The plugin already connects you to Coderbuds and brings the before-PR and after-PR moments with it, for you, in every repository. Setting a repository up does the rest for the team: it writes the two moments into the repository's own agent guidance, so Codex, Cursor and other agents follow them too, and it commits the plugin into the repository so teammates on Claude Code are offered it.

## Steps

1. Read the repository as `owner/name` from `git remote get-url origin`.
2. Call the Coderbuds `set-up-repository-tool` with `repository` set to that slug and `via_plugin` set to `true`.
3. Carry out every step it returns, in order. They come from Coderbuds for this repository's team, so follow them rather than improvising your own.

## Notes

- If Coderbuds isn't connected yet, run `/mcp`, choose `plugin:coderbuds:coderbuds`, and select Authenticate. Then start again.
- If Coderbuds answers that the repository isn't tracked, stop. It isn't one of the team's repositories, or it hasn't been connected to Coderbuds yet, and a person fixes that from Coderbuds.
