# Format Until Clean

Run the formatter, fix any remaining style issues, and loop until the codebase formats cleanly with no diffs.

Source: https://loops.elorm.xyz/loops/format-until-clean
Category: Testing
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, any
Tags: format, prettier, quality

## Steps

1. Run formatter

Run the project formatter (prettier, biome, etc.).

Check:

```sh
npm run format
```

2. Check diff

If formatting changed files, review diff for unintended edits. Fix manual style issues formatter missed.

3. Confirm clean

Re-run formatter and confirm working tree is stable.

Check:

```sh
npm run format && git diff --quiet
```

## Exit Condition

Type: lint_clean
Description: Formatter produces no remaining diff

Command:

```sh
npm run format && git diff --quiet
```
Max iterations: 5

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green

## Kickoff Prompt

```
Start the "Format Until Clean" loop.

Goal: formatter runs cleanly with no remaining diff
Max iterations: 5
Between iterations run: npm run format
Exit when: format command succeeds and git diff is empty

Step 1: Run the formatter. Fix any issues it cannot auto-fix, then repeat.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green
```

## Provided Files

- .cursor/loops/format-until-clean/README.md
- .cursor/loops/format-until-clean/kickoff.md
