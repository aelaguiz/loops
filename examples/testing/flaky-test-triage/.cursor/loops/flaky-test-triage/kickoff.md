Start the "Flaky Test Triage" loop.

Goal: classify failing tests as flaky vs real and fix only real regressions
Max iterations: 5
Between iterations run: npm test -- --testPathPattern=<failing-suite>
Exit when: every failure is classified and real regressions are fixed or explicitly deferred

Step 1: Run the failing suite multiple times. Classify each failure, fix real ones, and document flaky behavior.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green