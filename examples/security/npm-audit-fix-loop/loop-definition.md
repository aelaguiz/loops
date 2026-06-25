# npm Audit Fix Loop

Fix high/critical npm audit findings one at a time with test verification — not a blind npm audit fix --force.

Source: https://loops.elorm.xyz/loops/npm-audit-fix-loop
Category: Security
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, claude-code, any
Tags: security, npm, audit

## Steps

1. List vulnerabilities

Run npm audit --json. Pick the highest severity fixable issue (one at a time).

Check:

```sh
npm audit --audit-level=high
```

2. Apply safe fix

Use npm audit fix for that advisory or bump the direct dependency. Avoid --force unless unavoidable.

Check:

```sh
npm test
```

## Exit Condition

Type: lint_clean
Description: No high or critical npm audit vulnerabilities remain

Command:

```sh
npm audit --audit-level=high
```
Max iterations: 10

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "npm Audit Fix Loop" loop.

Goal: no high or critical npm audit vulnerabilities
Max iterations: 10
Between iterations run: npm audit --audit-level=high && npm test
Exit when: npm audit reports no high/critical issues

Step 1: Pick one high/critical advisory, apply the safest fix, run tests, and repeat.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/npm-audit-fix-loop/README.md
- .cursor/loops/npm-audit-fix-loop/kickoff.md
