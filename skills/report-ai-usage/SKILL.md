---
name: report-ai-usage
description: Use right after opening a pull request in a repository the team tracks in Coderbuds. Records which agent wrote the change, how much of it, and what a person was seen to review, so the team's AI adoption numbers come from a report instead of a guess.
---

# Report AI usage after opening a pull request

Without a report, Coderbuds infers AI authorship from the shape of the diff, and that inference is what the team's AI adoption figures are built from. You know the answer, so say it.

## Steps

1. Call the Coderbuds `report-ai-usage-tool` with:
   - `repository`: the `owner/name` slug from `git remote get-url origin`
   - `pull_request_number`: the number of the pull request you just opened
   - `tool`: the product the person is working in, such as `claude-code`, not the model
   - `model`: the model you are running as, if you know it
   - `authorship`: `agent_authored` if you wrote essentially all of it, `agent_assisted` if you wrote a meaningful part, `human_authored` if the person wrote it and you only helped
   - `review_evidence`: only what you saw the person do before the pull request went up
2. Leave it there. The report is idempotent, so calling it again for the same pull request updates the record rather than counting twice.

## Choosing `review_evidence`

List only what happened in front of you in this session:

- `approved_each_edit`: the person approved each edit as you made it
- `diff_comments`: the person commented on the diff
- `edited_by_person`: the person changed the code themselves
- `replied_after_changes`: the person replied after the change was finished

An empty list is the honest answer for most agent-opened pull requests. A flattering list is worse than none, because the team reads it as review that happened.

If Coderbuds answers that the repository isn't tracked, stop calling Coderbuds from this repository for the rest of the session.
