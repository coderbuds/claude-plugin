---
name: team-status
description: Use when someone asks what they should work on, what is blocking them or the team, what is waiting for review, what merged but hasn't shipped, or wants standup notes, and their team uses Coderbuds.
---

# Answer "what's blocking us?" from Coderbuds

Coderbuds holds the team's live pull request, review and deployment data. Pick the narrowest tool that answers the question, and lead with its headline.

| The question | Coderbuds tool |
| :- | :- |
| "What should I do next?", "standup notes", "what's blocking me?" | `get-my-status-tool` |
| "What's waiting for review?", "whose PRs are stuck?" | `get-open-pull-requests-tool` |
| "Why is the team slow?", "where does work wait?" | `find-delivery-bottleneck-tool` |
| "What merged but hasn't shipped?" | `get-undeployed-pull-requests-tool` |
| "How are we doing?", DORA metrics | `get-dora-metrics-tool` |
| "Which repository does this belong in?" | `get-team-context-tool` |

## Notes

- Pass `repository` as `owner/name` when you are working inside a repository, from `git remote get-url origin`. Coderbuds uses it to work out which team the question is about.
- Outside a repository, such as in a chat, leave `repository` out. Coderbuds uses the person's only team. If they are on several, it answers with the list, and passing any repository from the team they mean resolves it.
- Give the answer, then the one thing the person can do about it, such as reviewing the oldest waiting pull request. Don't paste the whole response back.
