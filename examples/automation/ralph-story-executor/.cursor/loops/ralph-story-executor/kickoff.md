Start the "Ralph Story Executor" loop.

Goal: every story in .ralph/prd.json has passes: true
Max iterations: 20
Between iterations run: npm test && npm run lint && npm run build
Exit when: no stories remain with passes: false (respond "ALL STORIES ARE COMPLETE")

Step 1: Read .ralph/prd.json and .ralph/progress.md. Pick one incomplete story, implement it, run backpressure checks, commit, update prd.json and progress.md, then stop this iteration.

Self-pace this loop. Each iteration does exactly one story. State lives on disk, not in chat history.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics