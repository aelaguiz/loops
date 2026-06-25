# Guardrails Learning Loop

When a check fails twice the same way, append a guardrail sign to .ralph/guardrails.md so the next iteration avoids repeating it.

Source: https://loops.elorm.xyz/loops/guardrails-learning-loop
Category: Automation
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor, claude-code
Compatible agents: cursor, claude-code, codex
Tags: ralph, guardrails, learning

## Steps

1. Read guardrails

Read .ralph/guardrails.md before any work. Treat each sign as a hard constraint.

2. Run checks

Run the project's backpressure commands.

Check:

```sh
npm test && npm run lint
```

3. Record failure sign

If the same error occurred before, append a concise sign to guardrails.md: what failed and how to avoid it.

4. Fix with guardrails

Apply a fix that respects all guardrail signs. Do not repeat prior failed approaches.

## Exit Condition

Type: tests_pass
Description: Checks pass and no repeated failure pattern remains

Command:

```sh
npm test && npm run lint
```
Max iterations: 12

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Guardrails Learning Loop" loop.

Goal: tests and lint pass without repeating prior failure patterns
Max iterations: 12
Between iterations run: npm test && npm run lint
Exit when: all checks pass

Step 1: Read .ralph/guardrails.md, run checks, and if a failure repeats, add a sign before fixing.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .ralph/guardrails.md
