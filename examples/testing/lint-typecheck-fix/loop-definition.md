# Lint and Typecheck Fix

Run lint and typecheck, fix reported issues, and loop until the codebase is clean.

Source: https://loops.elorm.xyz/loops/lint-typecheck-fix
Category: Testing
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, any
Tags: lint, typescript, quality

## Steps

1. Run lint and typecheck

Run lint and TypeScript checks.

Check:

```sh
npm run lint && npx tsc --noEmit
```

2. Fix issues

Fix lint and type errors with minimal changes. Do not disable rules unless necessary.

## Exit Condition

Type: lint_clean
Description: Lint and typecheck pass with no errors

Command:

```sh
npm run lint && npx tsc --noEmit
```
Max iterations: 8

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Lint and Typecheck Fix" loop.

Goal: lint and typecheck are clean
Max iterations: 8
Between iterations run: npm run lint && npx tsc --noEmit
Exit when: both commands exit 0

Step 1: Run lint and typecheck. Fix reported issues with minimal diffs, then repeat.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/lint-typecheck-fix/README.md
- .cursor/loops/lint-typecheck-fix/kickoff.md

## Examples

- Monorepo cleanup pass: Cleared 24 ESLint warnings and 8 TypeScript errors across 5 files without disabling rules.
