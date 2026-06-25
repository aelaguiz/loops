# PR Watch Loop

Poll open PRs labeled codex-watch every 15 minutes, review activity, and flag regressions or stale threads.

Source: https://loops.elorm.xyz/loops/pr-watch-loop
Category: CI
Trigger: interval
Trigger config: {"interval":"15m"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: codex, cursor
Compatible agents: codex, cursor
Tags: ci, pr, watch, codex

## Steps

1. List watched PRs

List open PRs with the codex-watch label. Summarize CI status, review state, and last activity.

Check:

```sh
gh pr list --label codex-watch --json number,title,state,statusCheckRollup
```

2. Check CI and reviews

For each watched PR, check failing checks, unresolved review comments, and merge conflicts.

3. Report or act

Post a brief status update. Fix trivial CI failures or ping the author for blockers.

## Exit Condition

Type: manual
Description: Watch report delivered for all codex-watch PRs

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
/loop 15m Start the "PR Watch Loop".

Goal: keep codex-watch PRs healthy and unblocked.
Between iterations run: gh pr list --label codex-watch --json number,title,state,statusCheckRollup
Exit when: status report is delivered for every watched PR.

Step 1: List codex-watch PRs, check CI and reviews, and report or fix trivial blockers.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/pr-watch-loop/README.md
- .cursor/loops/pr-watch-loop/kickoff.md
