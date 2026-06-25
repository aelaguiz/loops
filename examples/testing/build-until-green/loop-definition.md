# Build Until Green

Run the production build, fix compile and bundling errors, and loop until the build succeeds.

Source: https://loops.elorm.xyz/loops/build-until-green
Category: Testing
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor, claude-code
Compatible agents: cursor, claude-code
Tags: build, compile, ci

## Steps

1. Run build

Run the project build command and capture all errors.

Check:

```sh
npm run build
```

2. Fix build errors

Fix compile, type, and bundling errors one at a time. Prefer minimal diffs.

3. Re-run build

Run the build again and confirm errors are resolved.

Check:

```sh
npm run build
```

## Exit Condition

Type: tests_pass
Description: Production build completes with exit code 0

Command:

```sh
npm run build
```
Max iterations: 10

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green

## Kickoff Prompt

```
Start the "Build Until Green" loop.

Goal: production build succeeds
Max iterations: 10
Between iterations run: npm run build
Exit when: npm run build exits 0

Step 1: Run the build. If it fails, fix the first error, then repeat until green.

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

- .cursor/loops/build-until-green/README.md
- .cursor/loops/build-until-green/kickoff.md
