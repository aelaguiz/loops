# Flaky Test Triage

Run failing tests repeatedly, classify each failure as flaky or real, and fix only confirmed regressions.

Source: https://loops.elorm.xyz/loops/flaky-test-triage
Category: Testing
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code, cursor
Compatible agents: cursor, claude-code
Tags: testing, flaky, triage

## Steps

1. Run failing tests

Run the failing test file or suite 3–5 times. Record pass/fail pattern per test.

Check:

```sh
npm test -- --testPathPattern=<failing-suite>
```

2. Classify failures

Label each failure as flaky (intermittent) or real (consistent). Note timing, ordering, or env dependencies.

3. Fix real failures

Fix confirmed real failures with minimal changes. For flaky tests, propose stabilization (retries, isolation, mocks).

4. Confirm stability

Re-run the suite multiple times to confirm real failures are gone and flakiness is reduced or documented.

Check:

```sh
npm test -- --testPathPattern=<failing-suite>
```

## Exit Condition

Type: manual
Description: All failures classified; real regressions fixed; flaky tests documented or stabilized

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green

## Kickoff Prompt

```
Start the "Flaky Test Triage" loop.

Goal: classify failing tests as flaky vs real and fix only real regressions
Max iterations: 5
Between iterations run: npm test -- --testPathPattern=<failing-suite>
Exit when: every failure is classified and real regressions are fixed or explicitly deferred

Step 1: Run the failing suite multiple times. Classify each failure, fix real ones, and document flaky behavior.

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

- .cursor/loops/flaky-test-triage/README.md
- .cursor/loops/flaky-test-triage/kickoff.md
