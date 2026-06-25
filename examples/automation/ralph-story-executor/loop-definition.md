# Ralph Story Executor

Fresh-context loop: pick one incomplete story from prd.json, implement it, run backpressure checks, commit, and update progress before the next iteration.

Source: https://loops.elorm.xyz/loops/ralph-story-executor
Category: Automation
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor, claude-code
Compatible agents: cursor, claude-code, codex
Tags: ralph, automation, prd, fresh-context

## Steps

1. Read state

Read .ralph/prd.json and .ralph/progress.md. Resume any story marked inProgress, else pick the lowest-priority story with passes: false.

2. Implement one story

Implement exactly one user story with minimal scope. Mark it inProgress in prd.json before coding.

3. Run backpressure

Run the project's test, lint, and build commands from AGENTS.md. Fix failures before committing.

Check:

```sh
npm test && npm run lint && npm run build
```

4. Commit and record

Commit with a story-scoped message. Set passes: true in prd.json and append learnings to progress.md.

## Exit Condition

Type: manual
Description: All stories in prd.json have passes: true

Command:

```sh
cat .ralph/prd.json | grep -c '"passes": false' || true
```
Max iterations: 20

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
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
```

## Provided Files

- .ralph/prd.json
- .ralph/progress.md
- .ralph/guardrails.md
- .cursor/loops/ralph-story-executor/README.md
