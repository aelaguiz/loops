Start the "Independent Verifier Pass" loop.

Goal: build, lint, and tests pass under independent verification
Max iterations: 8
Between iterations run: npm run build && npm run lint && npm test
Exit when: all verifier commands exit 0

Step 1: Run build, lint, and tests as a verifier. Trust only command output, not prior claims.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green