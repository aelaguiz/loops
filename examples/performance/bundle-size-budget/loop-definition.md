# Bundle Size Budget

Ship features without bloating the client bundle — loop until size checks pass under your budget threshold.

Source: https://loops.elorm.xyz/loops/bundle-size-budget
Category: Performance
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, any
Tags: performance, bundle, frontend

## Steps

1. Measure bundle

Run the production build and bundle size check. Report total KB and the largest new chunks.

Check:

```sh
npm run build && npm run size-limit
```

2. Trim or lazy-load

If over budget: dynamic-import heavy modules, remove unused deps, or split routes. No feature cuts unless necessary.

## Exit Condition

Type: tests_pass
Description: Bundle size is under the configured budget

Command:

```sh
npm run size-limit
```
Max iterations: 6

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Bundle Size Budget" loop.

Goal: client bundle stays under the size-limit budget
Max iterations: 6
Between iterations run: npm run build && npm run size-limit
Exit when: size-limit exits 0

Step 1: Build and measure bundle size. If over budget, lazy-load or trim deps until size-limit passes.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/bundle-size-budget/README.md
- .cursor/loops/bundle-size-budget/kickoff.md
