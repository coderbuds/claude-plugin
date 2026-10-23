---
name: check-change-fit
description: Use just before opening a pull request in a repository the team tracks in Coderbuds. Compares the diff with the team's own merged pull requests and review queue, and records what was decided when the change doesn't fit.
---

# Check a change's fit before opening the pull request

Coderbuds knows how this team ships: the size its pull requests usually merge at, how long each size takes to get reviewed, and what is already waiting for a reviewer. This check takes a few seconds and tells you whether the change you are about to open fits that, while splitting it is still cheap.

## Steps

1. Find the repository slug with `git remote get-url origin` and turn it into `owner/name`.
2. Get the diff against the branch the pull request will target. Use the repository's default branch unless you know otherwise:

   ```bash
   git diff --numstat origin/<base>...
   ```

3. Work out the distinct outcomes a reviewer has to approve. Describe outcomes, not layers: an API, a UI, a migration and their tests that deliver one behaviour are one outcome, not four.
4. Call the Coderbuds `assess-change-fit-tool` with `repository`, the `numstat` output, and the outcomes as `review_goals`.
5. Act on the verdict:
   - `fits`: open the pull request.
   - Anything else: split or trim the change if it is genuinely severable, meaning each piece stands alone and is worth reviewing on its own. Otherwise call `record-change-fit-decision-tool` with `decision: proceeded` and a one-sentence `reason`, then open the pull request.

## Notes

- If Coderbuds answers that the repository isn't tracked, stop calling Coderbuds from this repository for the rest of the session.
- The verdict names are for the recorded decision the team reads. In your summary to the person, say what you did in plain words rather than quoting the verdict.
- A recorded `proceeded` decision is the decision. Don't ask the person to confirm it again or re-raise it later in the session.
