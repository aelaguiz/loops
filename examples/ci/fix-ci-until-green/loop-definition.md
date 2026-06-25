# Fix CI Until Green

Fetch the latest failed CI run, reproduce the failure locally, fix it, and repeat until checks pass.

Source: https://loops.elorm.xyz/loops/fix-ci-until-green
Category: CI
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor, claude-code
Compatible agents: cursor, claude-code
Tags: ci, github, fix

## Steps

1. Fetch failed run

Use gh to find the latest failed CI run on this branch. Pull logs for the failing job.

Check:

```sh
gh run list --branch $(git branch --show-current) --status failure --limit 1
```

2. Reproduce locally

Run the failing CI step locally (test, lint, build). Confirm you can reproduce the error.

3. Apply fix

Fix the root cause with a minimal diff. Avoid unrelated refactors.

4. Push and verify

Push the fix and wait for CI. Re-check status before the next iteration.

Check:

```sh
gh run list --branch $(git branch --show-current) --limit 1 --json conclusion -q '.[0].conclusion'
```

## Exit Condition

Type: ci_green
Description: Latest CI run conclusion is success

Command:

```sh
gh run list --branch $(git branch --show-current) --limit 1 --json conclusion -q '.[0].conclusion'
```
Max iterations: 8

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Fix CI Until Green" loop.

Goal: latest CI run on this branch passes
Max iterations: 8
Between iterations run: gh run list --branch $(git branch --show-current) --limit 1 --json conclusion -q '.[0].conclusion'
Exit when: latest run conclusion is success

Step 1: Find the latest failed CI run, read logs, reproduce locally, fix root cause, push, and verify.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/fix-ci-until-green/README.md
- .cursor/loops/fix-ci-until-green/kickoff.md
