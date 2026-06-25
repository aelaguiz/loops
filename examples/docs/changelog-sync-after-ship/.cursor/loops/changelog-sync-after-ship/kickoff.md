Start the "Changelog Sync After Ship" loop.

Goal: CHANGELOG.md has accurate [Unreleased] entries for this ship
Max iterations: 3
Between iterations run: git log -5 --oneline
Exit when: changelog covers all user-visible changes

Step 1: Review recent commits, write Keep-a-Changelog entries for user-visible changes, and verify completeness.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics