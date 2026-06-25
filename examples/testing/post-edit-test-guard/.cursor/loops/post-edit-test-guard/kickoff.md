Install and run the "Post-Edit Test Guard" loop.

Goal: after each batch of file edits, related tests must pass before continuing.
Between iterations run: npm test -- --findRelatedTests <edited files>
Exit when: related tests exit 0.

Step 1: After edits, run related tests. If they fail, fix before making more changes.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green