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