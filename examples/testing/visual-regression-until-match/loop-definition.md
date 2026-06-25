# Visual Regression Until Match

Run Playwright or Percy visual snapshots on UI changes; fix unintended diffs until baselines match intentionally.

Source: https://loops.elorm.xyz/loops/visual-regression-until-match
Category: Testing
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, any
Tags: testing, visual, playwright, ui

## Steps

1. Run visual tests

Run visual regression tests. List screenshots that differ from baseline with component names.

Check:

```sh
npx playwright test --grep @visual
```

2. Fix or approve

If diffs are bugs, fix CSS/markup. If intentional, update snapshots only after verifying in report.

## Exit Condition

Type: tests_pass
Description: Visual regression tests pass with approved baselines

Command:

```sh
npx playwright test --grep @visual
```
Max iterations: 6

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green

## Kickoff Prompt

```
Start the "Visual Regression Until Match" loop.

Goal: visual regression suite passes with intentional UI only
Max iterations: 6
Between iterations run: npx playwright test --grep @visual
Exit when: visual tests exit 0

Step 1: Run visual tests. Fix unintended UI diffs; update baselines only for deliberate design changes.

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

- .cursor/loops/visual-regression-until-match/README.md
- .cursor/loops/visual-regression-until-match/kickoff.md
