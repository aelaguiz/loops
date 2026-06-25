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