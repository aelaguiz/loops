Start the "Lint and Typecheck Fix" loop.

Goal: lint and typecheck are clean
Max iterations: 8
Between iterations run: npm run lint && npx tsc --noEmit
Exit when: both commands exit 0

Step 1: Run lint and typecheck. Fix reported issues with minimal diffs, then repeat.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics