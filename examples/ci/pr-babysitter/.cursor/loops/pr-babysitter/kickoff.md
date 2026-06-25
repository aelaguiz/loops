/loop 15m Start the "PR Babysitter" loop.

Goal: open PRs labeled codex-watch are healthy (CI green, rebased, not stale).
Max iterations: 20.
Between iterations run: gh pr list --label "codex-watch"
Exit when: each watched PR is green and current, or escalated.

Step 1: List watched PRs. Fix CI once, rebase if behind, comment if stale. Escalate repeated failures.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics