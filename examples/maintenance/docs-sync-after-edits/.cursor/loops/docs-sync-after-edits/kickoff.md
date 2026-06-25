Start the "Docs Sync After Edits" loop.

Goal: documentation matches the current code changes
Max iterations: 3
Between iterations run: git diff main...HEAD --name-only
Exit when: all affected docs are updated and verified

Step 1: Review the diff, find stale docs, update them, and verify accuracy.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics