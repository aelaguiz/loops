# Investigation Script Loop

Write a small throwaway script to reproduce a bug, run it, read output, and iterate until the root cause is proven.

Source: https://loops.elorm.xyz/loops/investigation-script-loop
Category: Debugging
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor, claude-code
Compatible agents: cursor, claude-code, codex, any
Tags: debugging, repro, scripts

## Steps

1. Write probe script

Create a ~20-line script that reproduces the bug or queries the failing state. One file only.

2. Run and read

Execute the script and capture stdout/stderr. No guessing — read actual output.

3. Adjust hypothesis

Update the script or notes based on output. Stop when root cause is demonstrated.

## Exit Condition

Type: manual
Description: Root cause demonstrated by script output with a written summary
Max iterations: 8

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Investigation Script Loop" loop.

Goal: prove the root cause with a minimal repro script
Max iterations: 8
Between iterations run: node scripts/investigate.mjs
Exit when: script output demonstrates root cause

Step 1: Write a tiny throwaway script that reproduces the issue. Run it and iterate on what the output shows.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/investigation-script-loop/README.md
- .cursor/loops/investigation-script-loop/kickoff.md
