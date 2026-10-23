# Coderbuds for Claude

[Coderbuds](https://coderbuds.com) knows how your team ships: the size your pull requests usually merge at, how long reviews take, what is waiting for a reviewer, and what merged but never reached production. This plugin brings that into Claude at the moments it is useful.

- **Before you open a pull request**, Claude checks the diff against your team's own merged pull requests and review queue, while splitting the change is still cheap.
- **After you open one**, Claude records which agent wrote it, how much of it, and what a person was seen to review. Your team's AI adoption figures then come from a report instead of a guess from the shape of the diff.
- **Whenever you ask** what is blocking you, what is waiting for review, or what merged but hasn't shipped, Claude answers from your team's live data.

You need a Coderbuds account with your repositories connected. Coderbuds supports GitHub and Bitbucket. [Start a free trial](https://coderbuds.com).

## What's in it

| Component | What it does |
| :- | :- |
| MCP server `coderbuds` | Connects to `https://coderbuds.com/mcp/insights`. You sign in with your Coderbuds account through OAuth the first time a tool is used. There is no token to copy. |
| Skill `check-change-fit` | Before a pull request: runs `git diff --numstat`, calls `assess-change-fit-tool`, and records a decision when the change goes up anyway. |
| Skill `report-ai-usage` | After a pull request: calls `report-ai-usage-tool` with the pull request number. |
| Skill `team-status` | Picks the right Coderbuds tool for "what's blocking us?" questions. |
| Hooks | After `git push`, and after a pull request is opened with `gh pr create` or a GitHub MCP tool, add one sentence to Claude's context naming the matching skill. Claude Code and Cowork only. |

## What it sends, and where

- **The hooks send nothing.** Each one is a shell script in `scripts/` that prints a fixed sentence. They make no network calls and read no files.
- **The skills call the Coderbuds MCP server at `coderbuds.com`**, and only when Claude uses them. A call carries the repository's `owner/name`, a pull request number, a diff's file paths and line counts from `git diff --numstat`, and short text Claude writes, such as the outcomes a reviewer has to approve or a one-line reason. No tool asks for the contents of a file.
- Coderbuds logs each tool call with its arguments and your agent's name and version, and deletes the log after 180 days. See the [privacy policy](https://coderbuds.com/docs/privacy).
- In a repository your team doesn't track, Coderbuds answers that it isn't tracked and logs that a call was made without its arguments, and the skills tell Claude to stop calling it there.

## Install

From the Claude directory: open **Customize > Plugins > Discover** in Claude, or run `/plugin directory` in Claude Code, and search for Coderbuds.

From this repository, in Claude Code:

```bash
/plugin marketplace add coderbuds/claude-plugin
/plugin install coderbuds@coderbuds
```

If you already added Coderbuds by hand with `claude mcp add`, remove that entry with `claude mcp remove coderbuds` so Claude sees one set of tools, not two.

## Support

- Documentation: [coderbuds.com/docs/mcp](https://coderbuds.com/docs/mcp)
- Questions and problems: [support@coderbuds.com](mailto:support@coderbuds.com) or [open an issue](https://github.com/coderbuds/claude-plugin/issues)

## License

MIT
