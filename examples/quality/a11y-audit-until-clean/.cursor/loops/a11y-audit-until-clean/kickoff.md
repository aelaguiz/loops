Start the "A11y Audit Until Clean" loop.

Goal: zero serious accessibility violations on changed UI
Max iterations: 8
Between iterations run: npm run test:a11y
Exit when: a11y audit exits 0

Step 1: Run the a11y audit on changed routes. Fix each violation, prioritizing keyboard and screen reader issues.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics