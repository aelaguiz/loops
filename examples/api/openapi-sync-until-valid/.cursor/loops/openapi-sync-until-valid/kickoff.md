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