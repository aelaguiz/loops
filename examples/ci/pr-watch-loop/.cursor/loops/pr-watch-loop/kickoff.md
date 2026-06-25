/loop 15m Start the "PR Watch Loop".

Goal: keep codex-watch PRs healthy and unblocked.
Between iterations run: gh pr list --label codex-watch --json number,title,state,statusCheckRollup
Exit when: status report is delivered for every watched PR.

Step 1: List codex-watch PRs, check CI and reviews, and report or fix trivial blockers.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics