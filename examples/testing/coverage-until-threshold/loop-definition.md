# Coverage Until Threshold

Add focused tests until coverage meets your threshold (e.g. 80%), without changing production behavior unnecessarily.

Source: https://loops.elorm.xyz/loops/coverage-until-threshold
Category: Testing
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code
Compatible agents: claude-code, cursor
Tags: coverage, testing, quality

## Steps

1. Measure coverage

Run tests with coverage reporting enabled.

Check:

```sh
npm test -- --coverage
```

2. Add tests

Write the smallest tests needed to cover uncovered branches. No snapshot spam or trivial asserts.

3. Re-measure

Re-run coverage and confirm threshold is met.

Check:

```sh
npm test -- --coverage
```

## Exit Condition

Type: tests_pass
Description: Coverage threshold met and all tests pass

Command:

```sh
npm test -- --coverage
```
Max iterations: 12

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green

## Kickoff Prompt

```
Start the "Coverage Until Threshold" loop.

Goal: coverage meets the target threshold (default 80%) with all tests passing
Max iterations: 12
Between iterations run: npm test -- --coverage
Exit when: coverage threshold is met and tests exit 0

Step 1: Run coverage. Add focused tests for the biggest uncovered gaps, then repeat.

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

- .cursor/loops/coverage-until-threshold/README.md
- .cursor/loops/coverage-until-threshold/kickoff.md
