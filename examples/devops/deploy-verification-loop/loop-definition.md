# Deploy Verification Loop

On an interval, hit health and smoke endpoints after a deploy until all checks return healthy responses.

Source: https://loops.elorm.xyz/loops/deploy-verification-loop
Category: DevOps
Trigger: interval
Trigger config: {"interval":"15m"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: codex, cursor
Compatible agents: codex, cursor, claude-code
Tags: deploy, devops, smoke-test

## Steps

1. Check health endpoints

Curl configured health/smoke URLs. Record status codes and response bodies.

Check:

```sh
curl -fsS https://your-app.example/health
```

2. Investigate failures

If any endpoint fails, check recent deploy logs, env vars, and migrations. Apply the smallest fix.

3. Re-verify

Re-run health checks after fixes or rollback decision.

## Exit Condition

Type: ci_green
Description: All configured health endpoints return success

Command:

```sh
curl -fsS https://your-app.example/health
```
Max iterations: 8

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
/loop 15m Start the "Deploy Verification Loop".

Goal: all post-deploy health and smoke endpoints return success.
Max iterations: 8.
Between iterations run: curl -fsS <your-health-url>
Exit when: every configured endpoint succeeds.

Step 1: Hit health/smoke URLs. If any fail, inspect deploy logs and fix or escalate.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/deploy-verification-loop/README.md
- .cursor/loops/deploy-verification-loop/kickoff.md
