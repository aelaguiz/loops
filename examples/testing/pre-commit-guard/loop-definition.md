# Pre-Commit Guard

Hook that runs tests before git commit commands to block commits when the suite is red.

Source: https://loops.elorm.xyz/loops/pre-commit-guard
Category: Testing
Trigger: event
Trigger config: {"event":"file_edit"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, claude-code
Tags: hooks, testing, git, pre-commit

## Steps

1. Detect commit intent

When a git commit command is about to run, pause and run the test suite first.

2. Run tests

Run the full test suite before allowing the commit to proceed.

Check:

```sh
npm test
```

3. Block or allow

If tests fail, fix failures and re-run. Only allow the commit when tests pass.

## Exit Condition

Type: tests_pass
Description: Tests pass before each git commit

Command:

```sh
npm test
```

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green

## Kickoff Prompt

```
Install and run the "Pre-Commit Guard" loop.

Goal: block git commits when tests are failing.
Between iterations run: npm test
Exit when: tests exit 0 before each commit.

Step 1: Before any git commit, run tests. Fix failures before committing.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green
```

## Provided Files

- .cursor/hooks.json
- .claude/settings.json
- .cursor/loops/pre-commit-guard/README.md
