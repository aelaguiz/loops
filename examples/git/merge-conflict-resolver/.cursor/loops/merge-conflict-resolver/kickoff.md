Start the "Merge Conflict Resolver" loop.

Goal: branch is rebased on main with no conflicts and tests pass
Max iterations: 8
Between iterations run: npm test
Exit when: rebase completes and tests exit 0

Step 1: Rebase on main. Resolve conflicts one file at a time, run tests, continue.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics