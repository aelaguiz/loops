/loop 7d Start the "Dependency Audit Weekly" loop.

Goal: deliver a weekly dependency audit summary.
Between iterations run: npm outdated || true
Exit when: summary is posted with recommended upgrades.

Step 1: Run npm outdated, categorize updates, and propose a safe upgrade plan.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics