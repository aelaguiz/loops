/loop 15m Start the "Deploy Verification Loop".

Goal: all post-deploy health and smoke endpoints return success.
Max iterations: 8.
Between iterations run: curl -fsS <your-health-url>
Exit when: every configured endpoint succeeds.

Step 1: Hit health/smoke URLs. If any fail, inspect deploy logs and fix or escalate.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics