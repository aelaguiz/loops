Start the "npm Audit Fix Loop" loop.

Goal: no high or critical npm audit vulnerabilities
Max iterations: 10
Between iterations run: npm audit --audit-level=high && npm test
Exit when: npm audit reports no high/critical issues

Step 1: Pick one high/critical advisory, apply the safest fix, run tests, and repeat.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics