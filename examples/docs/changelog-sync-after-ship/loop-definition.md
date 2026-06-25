# Changelog Sync After Ship

After shipping a feature, loop until CHANGELOG.md has a user-facing entry and conventional commits are reflected.

Source: https://loops.elorm.xyz/loops/changelog-sync-after-ship
Category: Docs
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code
Compatible agents: cursor, claude-code, any
Tags: docs, changelog, release

## Steps

1. Diff since last tag

List commits and user-visible changes since the last release tag or CHANGELOG section.

Check:

```sh
git log $(git describe --tags --abbrev=0 2>/dev/null || echo HEAD~20)..HEAD --oneline
```

2. Write changelog entry

Add a Keep-a-Changelog entry under [Unreleased]: Added, Changed, Fixed. User-facing language only.

3. Verify format

Confirm CHANGELOG follows project format and links issues/PRs where relevant.

## Exit Condition

Type: manual
Description: CHANGELOG.md documents all user-visible changes in this ship
Max iterations: 3

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
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
```

## Provided Files

- .cursor/loops/changelog-sync-after-ship/README.md
- .cursor/loops/changelog-sync-after-ship/kickoff.md
