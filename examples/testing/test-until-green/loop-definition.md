# Test Until Green

Run your test suite, fix the smallest root cause on failure, and repeat until every test passes.

Source: https://loops.elorm.xyz/loops/test-until-green
Category: Testing
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor, claude-code
Compatible agents: cursor, claude-code, any
Tags: testing, tdd, ci

## Steps

1. Run tests

Run the project test command and capture failures.

Check:

```sh
npm test
```

2. Fix failures

Fix the smallest root cause for the current failing tests. Prefer minimal diffs.

3. Re-run tests

Run tests again and verify progress toward zero failures.

Check:

```sh
npm test
```

## Exit Condition

Type: tests_pass
Description: All tests pass (exit code 0)

Command:

```sh
npm test
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
Start the "Test Until Green" loop.

Goal: all tests pass
Max iterations: 10
Between iterations run: npm test
Exit when: tests exit 0

Step 1: Run tests. If there are failures, fix the smallest root cause, then repeat.

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

- .cursor/loops/test-until-green/README.md

## Examples

- Next.js app test suite: Fixed 3 failing Jest suites in 6 iterations. Root causes were async timing, missing mocks, and stale snapshots — no tests skipped.
