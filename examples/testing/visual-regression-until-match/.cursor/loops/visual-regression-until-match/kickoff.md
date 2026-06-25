Start the "Visual Regression Until Match" loop.

Goal: visual regression suite passes with intentional UI only
Max iterations: 6
Between iterations run: npx playwright test --grep @visual
Exit when: visual tests exit 0

Step 1: Run visual tests. Fix unintended UI diffs; update baselines only for deliberate design changes.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green