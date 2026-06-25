/loop 5m Start the "CI Failure Watcher" loop.

Goal: latest CI run on this branch is green.
Max iterations: 12.
Between iterations run: gh run list --branch $(git branch --show-current) --limit 1
Exit when: latest run conclusion is success.

Step 1: Check CI status. If failed, read logs, fix root cause, verify locally, and push if needed.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics