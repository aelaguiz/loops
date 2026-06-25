Install and run the "Post-Merge Regression Guard" loop.

Goal: smoke tests pass immediately after every merge or rebase.
Between iterations run: npm run test:smoke
Exit when: smoke suite exits 0.

Step 1: After a merge, run smoke tests. Fix regressions before continuing other work.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green