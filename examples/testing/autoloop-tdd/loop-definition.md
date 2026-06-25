# Autoloop TDD

Test-first loop: write a failing test, implement the minimum code to pass, refactor, and repeat.

Source: https://loops.elorm.xyz/loops/autoloop-tdd
Category: Testing
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code
Compatible agents: cursor, claude-code
Tags: tdd, testing, red-green-refactor

## Steps

1. Write failing test

Write a focused test for the next behavior. Run it and confirm it fails for the right reason.

Check:

```sh
npm test -- --testPathPattern=<new-test>
```

2. Implement minimum code

Write the smallest implementation that makes the new test pass. No extra features.

3. Verify green

Run the new test and full suite to confirm everything passes.

Check:

```sh
npm test
```

4. Refactor

Clean up duplication and naming while keeping tests green. Run tests after each refactor.

Check:

```sh
npm test
```

## Exit Condition

Type: tests_pass
Description: Target behavior covered by tests and full suite passes

Command:

```sh
npm test
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
Start the "Autoloop TDD" loop.

Goal: implement the target behavior test-first with a green suite
Max iterations: 12
Between iterations run: npm test
Exit when: target behavior is covered and all tests pass

Step 1: Write a failing test for the next behavior, implement the minimum code to pass, refactor, and repeat.

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

- .cursor/loops/autoloop-tdd/README.md
- .cursor/loops/autoloop-tdd/kickoff.md
