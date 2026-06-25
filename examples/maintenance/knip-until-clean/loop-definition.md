# Knip Until Clean

Find and remove dead exports, unused files, and orphan dependencies — loop until knip reports clean.

Source: https://loops.elorm.xyz/loops/knip-until-clean
Category: Maintenance
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, any
Tags: maintenance, dead-code, deps

## Steps

1. Run knip

Run knip (or depcheck) and categorize unused files, exports, and dependencies.

Check:

```sh
npx knip
```

2. Remove or justify

Delete confirmed dead code. For false positives, add knip ignore entries with a one-line reason.

## Exit Condition

Type: lint_clean
Description: Knip reports no unused files, exports, or dependencies

Command:

```sh
npx knip
```
Max iterations: 5

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Knip Until Clean" loop.

Goal: knip reports no unused code or dependencies
Max iterations: 5
Between iterations run: npx knip
Exit when: knip exits 0

Step 1: Run knip. Remove dead exports and unused deps with minimal diffs; verify tests still pass.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/knip-until-clean/README.md
- .cursor/loops/knip-until-clean/kickoff.md
