# OpenAPI Sync Until Valid

Keep openapi.yaml valid and in sync with route handlers — lint the spec and fix drift each pass.

Source: https://loops.elorm.xyz/loops/openapi-sync-until-valid
Category: API
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, any
Tags: api, openapi, docs

## Steps

1. Lint OpenAPI

Validate openapi.yaml with spectral or swagger-cli. List every error with line numbers.

Check:

```sh
npx @redocly/cli lint openapi.yaml
```

2. Sync handlers

Update route handlers or the spec so documented paths, schemas, and status codes match reality.

## Exit Condition

Type: lint_clean
Description: OpenAPI spec lints with zero errors

Command:

```sh
npx @redocly/cli lint openapi.yaml
```
Max iterations: 8

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "OpenAPI Sync Until Valid" loop.

Goal: openapi.yaml lints clean and matches implemented routes
Max iterations: 8
Between iterations run: npx @redocly/cli lint openapi.yaml
Exit when: OpenAPI lint exits 0

Step 1: Lint openapi.yaml. Fix spec errors and handler drift until lint passes.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/openapi-sync-until-valid/README.md
- .cursor/loops/openapi-sync-until-valid/kickoff.md
