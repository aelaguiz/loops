# PR Babysitter

Every 15 minutes, inspect open PRs with a watch label: nudge reviewers, fix CI, rebase if behind main.

Source: https://loops.elorm.xyz/loops/pr-babysitter
Category: CI
Trigger: interval
Trigger config: {"interval":"15m"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: codex, cursor
Compatible agents: codex, cursor
Tags: pr, github, ci, boris-cherny

## Steps

1. List watched PRs

List open PRs with the watch label. Skip merged, draft, or conflict-only PRs that need human product input.

Check:

```sh
gh pr list --label "codex-watch" --json number,title,mergeable,statusCheckRollup
```

2. Triage each PR

For each PR: if CI failed, fix once; if behind main, rebase; if stale review, leave a short status comment.

3. Escalate blockers

Stop on merge conflicts needing product decisions or the same failure twice. Report blockers clearly.

## Exit Condition

Type: manual
Description: All watched PRs are green, rebased, or escalated with a clear blocker note
Max iterations: 20

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
/loop 15m Start the "PR Babysitter" loop.

Goal: open PRs labeled codex-watch are healthy (CI green, rebased, not stale).
Max iterations: 20.
Between iterations run: gh pr list --label "codex-watch"
Exit when: each watched PR is green and current, or escalated.

Step 1: List watched PRs. Fix CI once, rebase if behind, comment if stale. Escalate repeated failures.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/pr-babysitter/README.md
- .cursor/loops/pr-babysitter/kickoff.md
