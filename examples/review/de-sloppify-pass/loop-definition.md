# De-Sloppify Pass

After implementation, run a cleanup pass: remove debug code, tighten naming, delete dead branches, and align with project conventions.

Source: https://loops.elorm.xyz/loops/de-sloppify-pass
Category: Review
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code, cursor
Compatible agents: cursor, claude-code, any
Tags: review, quality, cleanup

## Steps

1. Scan for slop

Review recent changes for debug logs, commented code, TODO hacks, oversized functions, and inconsistent naming.

2. Clean up

Apply minimal fixes: delete dead code, extract helpers, align types, and match surrounding style.

3. Verify

Run lint and tests to ensure cleanup did not break behavior.

Check:

```sh
npm run lint && npm test
```

## Exit Condition

Type: lint_clean
Description: No slop remains and lint/tests still pass

Command:

```sh
npm run lint && npm test
```
Max iterations: 4

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "De-Sloppify Pass" loop.

Goal: recent changes are clean, minimal, and convention-aligned
Max iterations: 4
Between iterations run: npm run lint && npm test
Exit when: review finds no slop and checks pass

Step 1: Review the diff for debug code, dead branches, and naming issues. Fix them with minimal diffs.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/de-sloppify-pass/README.md
- .cursor/loops/de-sloppify-pass/kickoff.md
