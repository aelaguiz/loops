Start the "Dependency Upgrade One-by-One" loop.

Goal: critical outdated deps are upgraded with green tests
Max iterations: 15
Between iterations run: npm outdated && npm test && npm run build
Exit when: npm outdated shows no critical packages left or user stops

Step 1: Pick one outdated package, upgrade it, fix breakages, commit, and stop. One package per iteration.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics