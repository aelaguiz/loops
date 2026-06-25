# Staging Smoke Test

Run a fixed smoke checklist against staging after deploy: auth, core flows, and error budgets.

Source: https://loops.elorm.xyz/loops/staging-smoke-test
Category: DevOps
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, claude-code
Tags: staging, smoke-test, deploy

## Steps

1. Run smoke checklist

Execute the staging smoke script or manual checklist (login, critical path, webhooks).

Check:

```sh
npm run smoke:staging
```

2. Fix failures

If smoke fails, trace logs, fix the smallest issue, and redeploy or hotfix as appropriate.

3. Confirm green

Re-run smoke until all checklist items pass.

Check:

```sh
npm run smoke:staging
```

## Exit Condition

Type: ci_green
Description: Staging smoke checklist passes

Command:

```sh
npm run smoke:staging
```
Max iterations: 6

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Staging Smoke Test" loop.

Goal: staging smoke checklist passes
Max iterations: 6
Between iterations run: npm run smoke:staging
Exit when: smoke command exits 0

Step 1: Run the staging smoke checklist. Fix the first failing item, then repeat.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/staging-smoke-test/README.md
- .cursor/loops/staging-smoke-test/kickoff.md
