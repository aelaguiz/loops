# Ship PR Until Green

Implement on a branch, run tests, push, open a PR, wait for CI, and loop until checks pass and the PR is ready to merge.

Source: https://loops.elorm.xyz/loops/ship-pr-until-green
Category: CI
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code, cursor
Compatible agents: claude-code, cursor, codex
Tags: pr, ci, ship, continuous-claude

## Steps

1. Implement and test

Make the scoped change and run local tests.

Check:

```sh
npm test
```

2. Commit and push

Commit with a clear message and push the branch.

3. Open or update PR

Open a PR with summary and test plan, or update existing PR.

Check:

```sh
gh pr view --json statusCheckRollup,url
```

4. Fix CI

If CI fails, read logs, fix once locally, push, and re-wait.

## Exit Condition

Type: ci_green
Description: PR checks pass and PR is merge-ready

Command:

```sh
gh pr checks --watch
```
Max iterations: 10

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Ship PR Until Green" loop.

Goal: PR is open with all CI checks passing
Max iterations: 10
Between iterations run: gh pr checks
Exit when: all PR checks are success

Step 1: Implement the change, test locally, push, open PR, and fix CI until green.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/ship-pr-until-green/README.md
- .cursor/loops/ship-pr-until-green/kickoff.md
