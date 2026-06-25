# Merge Conflict Resolver

Rebase or merge target branch, resolve conflicts file by file, and loop until the branch is current and tests pass.

Source: https://loops.elorm.xyz/loops/merge-conflict-resolver
Category: Git
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor, claude-code
Compatible agents: cursor, claude-code
Tags: git, rebase, merge

## Steps

1. Update branch

Fetch latest main and attempt rebase or merge.

Check:

```sh
git fetch origin && git rebase origin/main
```

2. Resolve conflicts

For each conflict, read both sides, preserve intent, and resolve with minimal changes.

3. Verify

Run tests after each resolution batch.

Check:

```sh
npm test
```

## Exit Condition

Type: tests_pass
Description: Rebase complete with no conflicts and tests passing

Command:

```sh
git rebase --continue 2>/dev/null; npm test
```
Max iterations: 8

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Merge Conflict Resolver" loop.

Goal: branch is rebased on main with no conflicts and tests pass
Max iterations: 8
Between iterations run: npm test
Exit when: rebase completes and tests exit 0

Step 1: Rebase on main. Resolve conflicts one file at a time, run tests, continue.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/merge-conflict-resolver/README.md
- .cursor/loops/merge-conflict-resolver/kickoff.md
