# Docs Sync After Edits

After code changes, find affected docs and update README, API references, and inline comments to match.

Source: https://loops.elorm.xyz/loops/docs-sync-after-edits
Category: Maintenance
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, any
Tags: docs, maintenance, sync

## Steps

1. Identify changed areas

Review the current diff. List public APIs, config options, and behaviors that changed.

2. Find stale docs

Search README, docs/, and code comments for references to changed behavior. Flag outdated sections.

3. Update documentation

Update docs to match the code. Keep examples runnable and accurate. Remove obsolete sections.

4. Verify accuracy

Re-read updated docs against the diff. Confirm no contradictions remain.

## Exit Condition

Type: manual
Description: All affected documentation updated and verified against the diff

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Docs Sync After Edits" loop.

Goal: documentation matches the current code changes
Max iterations: 3
Between iterations run: git diff main...HEAD --name-only
Exit when: all affected docs are updated and verified

Step 1: Review the diff, find stale docs, update them, and verify accuracy.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/docs-sync-after-edits/README.md
- .cursor/loops/docs-sync-after-edits/kickoff.md
