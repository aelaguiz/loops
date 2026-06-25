Start the "API Contract Until Match" loop.

Goal: API implementation matches the published contract
Max iterations: 10
Between iterations run: npm run test:contract
Exit when: contract test suite exits 0

Step 1: Run contract tests. Fix each schema/response mismatch with minimal diffs, then re-run.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics