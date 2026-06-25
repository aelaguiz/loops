# Reflexion Debug Loop

On each failed repro attempt, write a short reflection to disk, then retry with that memory — avoids repeating the same wrong fix.

Source: https://loops.elorm.xyz/loops/reflexion-debug-loop
Category: Debugging
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code, cursor
Compatible agents: cursor, claude-code, any
Tags: debugging, reflexion, memory

## Steps

1. Reproduce bug

Run the minimal repro steps or failing test. Capture exact error output.

Check:

```sh
npm test -- --testNamePattern=<failing-test>
```

2. Reflect on failure

Append to .loops/reflexion.md: what you tried, what failed, and one hypothesis to avoid next pass.

3. Apply targeted fix

Read reflexion.md. Apply a different fix than prior attempts. Prefer root cause over symptoms.

## Exit Condition

Type: tests_pass
Description: Previously failing test passes

Command:

```sh
npm test -- --testNamePattern=<failing-test>
```
Max iterations: 8

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Reflexion Debug Loop" loop.

Goal: the failing test or repro passes
Max iterations: 8
Between iterations run: npm test -- --testNamePattern=<failing-test>
Exit when: the repro test exits 0

Step 1: Reproduce the bug. If it fails, append a reflection to .loops/reflexion.md before trying a new fix.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .loops/reflexion.md
