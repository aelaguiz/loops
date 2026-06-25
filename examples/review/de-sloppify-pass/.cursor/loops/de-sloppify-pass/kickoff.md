Start the "De-Sloppify Pass" loop.

Goal: recent changes are clean, minimal, and convention-aligned
Max iterations: 4
Between iterations run: npm run lint && npm test
Exit when: review finds no slop and checks pass

Step 1: Review the diff for debug code, dead branches, and naming issues. Fix them with minimal diffs.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics