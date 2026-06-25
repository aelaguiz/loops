Start the "Reflexion Debug Loop" loop.

Goal: the failing test or repro passes
Max iterations: 8
Between iterations run: npm test -- --testNamePattern=<failing-test>
Exit when: the repro test exits 0

Step 1: Reproduce the bug. If it fails, append a reflection to .loops/reflexion.md before trying a new fix.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics