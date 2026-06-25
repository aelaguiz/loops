Install and run the "Pre-Commit Guard" loop.

Goal: block git commits when tests are failing.
Between iterations run: npm test
Exit when: tests exit 0 before each commit.

Step 1: Before any git commit, run tests. Fix failures before committing.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green