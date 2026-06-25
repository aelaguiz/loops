Start the "Spec-First Ship" loop.

Goal: every requirement in spec.md is implemented and checked off
Max iterations: 15
Between iterations run: npm test
Exit when: spec.md has no unchecked requirements

Step 1: Read spec.md, implement the first unchecked item, verify it, mark [x], and stop this iteration.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics