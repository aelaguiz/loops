# Post-Merge Regression Guard

Hook that runs smoke tests after git merge or rebase to catch integration regressions immediately.

Source: https://loops.elorm.xyz/loops/post-merge-regression-guard
Category: Testing
Trigger: event
Trigger config: {"event":"git_merge"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, claude-code
Tags: hooks, testing, git, merge

## Steps

1. Detect merge

Confirm a merge or rebase just completed. Identify affected areas from the diff stat.

2. Run smoke suite

Run the fast smoke test suite. Fix any failures before starting new feature work.

Check:

```sh
npm run test:smoke
```

## Exit Condition

Type: tests_pass
Description: Smoke tests pass after merge

Command:

```sh
npm run test:smoke
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
Install and run the "Post-Merge Regression Guard" loop.

Goal: smoke tests pass immediately after every merge or rebase.
Between iterations run: npm run test:smoke
Exit when: smoke suite exits 0.

Step 1: After a merge, run smoke tests. Fix regressions before continuing other work.

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
- .cursor/loops/post-merge-regression-guard/README.md
