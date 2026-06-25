# PR Self-Review

Review your own diff like a senior reviewer, fix issues, and repeat for three passes before opening the PR.

Source: https://loops.elorm.xyz/loops/pr-self-review
Category: Review
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code, cursor
Compatible agents: cursor, claude-code, any
Tags: review, pr, quality

## Steps

1. Review diff

Review the current branch diff. List bugs, edge cases, naming issues, and missing tests.

2. Address findings

Fix the highest-severity findings from the review with minimal scope.

3. Re-review

Review the updated diff and confirm prior findings are resolved.

## Exit Condition

Type: max_iterations
Description: Three review passes completed with no critical findings
Max iterations: 3

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "PR Self-Review" loop.

Goal: three clean self-review passes on the current diff
Max iterations: 3
Between iterations run: git diff main...HEAD
Exit when: three passes complete with no critical findings

Step 1: Review the diff like a senior reviewer. Fix findings, then re-review.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/pr-self-review/README.md
- .cursor/loops/pr-self-review/kickoff.md

## Examples

- Feature branch self-review: Three review passes caught a race condition, missing null check, and outdated test. PR opened with zero critical findings.
