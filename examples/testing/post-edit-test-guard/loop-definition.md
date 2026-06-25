# Post-Edit Test Guard

Hook-based loop that runs related tests after file edits to catch regressions early.

Source: https://loops.elorm.xyz/loops/post-edit-test-guard
Category: Testing
Trigger: event
Trigger config: {"event":"file_edit"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, claude-code
Tags: hooks, testing, regression

## Steps

1. Detect edited files

Identify which source files were edited in the last turn.

2. Run related tests

Run the smallest relevant test subset for edited files. Fix failures before continuing.

Check:

```sh
npm test -- --findRelatedTests
```

## Exit Condition

Type: tests_pass
Description: Related tests pass after each edit batch

Command:

```sh
npm test -- --findRelatedTests
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
Install and run the "Post-Edit Test Guard" loop.

Goal: after each batch of file edits, related tests must pass before continuing.
Between iterations run: npm test -- --findRelatedTests <edited files>
Exit when: related tests exit 0.

Step 1: After edits, run related tests. If they fail, fix before making more changes.

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
- .cursor/loops/post-edit-test-guard/README.md
