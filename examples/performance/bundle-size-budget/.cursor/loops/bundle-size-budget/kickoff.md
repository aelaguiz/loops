Start the "Bundle Size Budget" loop.

Goal: client bundle stays under the size-limit budget
Max iterations: 6
Between iterations run: npm run build && npm run size-limit
Exit when: size-limit exits 0

Step 1: Build and measure bundle size. If over budget, lazy-load or trim deps until size-limit passes.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics