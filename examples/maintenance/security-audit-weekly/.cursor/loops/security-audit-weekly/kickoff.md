/loop 7d Start the "Security Audit Weekly" loop.

Goal: deliver a weekly npm audit summary with a remediation plan.
Between iterations run: npm audit --json
Exit when: summary is posted with prioritized fixes.

Step 1: Run npm audit, triage by severity, and propose safe remediation steps.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics