# CI Failure Watcher

Poll CI on an interval, investigate failures when checks go red, and push fixes until green.

Source: https://loops.elorm.xyz/loops/ci-failure-watcher
Category: CI
Trigger: interval
Trigger config: {"interval":"5m"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor, claude-code
Compatible agents: cursor, claude-code
Tags: ci, github, devops

## Steps

1. Check CI status

Check the latest CI run for the current branch using gh CLI.

Check:

```sh
gh run list --branch $(git branch --show-current) --limit 1
```

2. Investigate failure

If CI failed, read logs, identify the root cause, and apply the smallest fix.

3. Verify locally

Run the failing CI step locally before pushing again.

## Exit Condition

Type: ci_green
Description: Latest CI run conclusion is success

Command:

```sh
gh run list --branch $(git branch --show-current) --limit 1 --json conclusion -q '.[0].conclusion'
```
Max iterations: 12

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
/loop 5m Start the "CI Failure Watcher" loop.

Goal: latest CI run on this branch is green.
Max iterations: 12.
Between iterations run: gh run list --branch $(git branch --show-current) --limit 1
Exit when: latest run conclusion is success.

Step 1: Check CI status. If failed, read logs, fix root cause, verify locally, and push if needed.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/ci-failure-watcher/watch.sh
- .cursor/loops/ci-failure-watcher/README.md
