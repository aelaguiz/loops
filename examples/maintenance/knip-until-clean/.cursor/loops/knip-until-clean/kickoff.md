Start the "Knip Until Clean" loop.

Goal: knip reports no unused code or dependencies
Max iterations: 5
Between iterations run: npx knip
Exit when: knip exits 0

Step 1: Run knip. Remove dead exports and unused deps with minimal diffs; verify tests still pass.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics