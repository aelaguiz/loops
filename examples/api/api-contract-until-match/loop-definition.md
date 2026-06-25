# API Contract Until Match

Loop until API responses match the OpenAPI or JSON Schema contract — catch drift between docs and implementation.

Source: https://loops.elorm.xyz/loops/api-contract-until-match
Category: API
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, claude-code, any
Tags: api, openapi, contract-testing

## Steps

1. Run contract tests

Run contract tests against openapi.yaml or schema fixtures. List every mismatch with endpoint and field.

Check:

```sh
npm run test:contract
```

2. Fix implementation or spec

Fix the smallest change: update handler types/validation or correct the spec if the code is canonical.

## Exit Condition

Type: tests_pass
Description: All API contract tests pass

Command:

```sh
npm run test:contract
```
Max iterations: 10

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "API Contract Until Match" loop.

Goal: API implementation matches the published contract
Max iterations: 10
Between iterations run: npm run test:contract
Exit when: contract test suite exits 0

Step 1: Run contract tests. Fix each schema/response mismatch with minimal diffs, then re-run.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/api-contract-until-match/README.md
- .cursor/loops/api-contract-until-match/kickoff.md
