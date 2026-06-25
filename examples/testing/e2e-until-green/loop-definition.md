# E2E Until Green

Run end-to-end tests, fix UI and integration failures, and loop until the E2E suite passes.

Source: https://loops.elorm.xyz/loops/e2e-until-green
Category: Testing
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, claude-code
Tags: e2e, playwright, testing

## Steps

1. Run E2E

Run the project's E2E test command and capture failures.

Check:

```sh
npm run test:e2e
```

2. Fix failures

Fix the smallest root cause for failing E2E specs. Prefer stable selectors and realistic waits.

3. Re-run E2E

Re-run E2E until all specs pass.

Check:

```sh
npm run test:e2e
```

## Exit Condition

Type: tests_pass
Description: E2E suite exits 0

Command:

```sh
npm run test:e2e
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
Start the "E2E Until Green" loop.

Goal: E2E suite passes
Max iterations: 10
Between iterations run: npm run test:e2e
Exit when: E2E command exits 0

Step 1: Run E2E tests. Fix the first failing spec, then repeat.

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

- .cursor/loops/e2e-until-green/README.md
- .cursor/loops/e2e-until-green/kickoff.md
