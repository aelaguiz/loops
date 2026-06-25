# Spec-First Ship

Implement from a written spec.md checklist — each iteration completes one unchecked requirement with verification.

Source: https://loops.elorm.xyz/loops/spec-first-ship
Category: Planning
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code, cursor
Compatible agents: cursor, claude-code, codex, any
Tags: planning, spec, requirements

## Steps

1. Read spec

Read spec.md. Pick the first unchecked requirement. Do not start multiple requirements in one pass.

2. Implement requirement

Implement that single requirement with tests. Mark it [x] in spec.md only after verification.

3. Verify

Run tests and manual checks listed in the spec for this requirement.

Check:

```sh
npm test
```

## Exit Condition

Type: manual
Description: Every requirement in spec.md is checked off
Max iterations: 15

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Spec-First Ship" loop.

Goal: every requirement in spec.md is implemented and checked off
Max iterations: 15
Between iterations run: npm test
Exit when: spec.md has no unchecked requirements

Step 1: Read spec.md, implement the first unchecked item, verify it, mark [x], and stop this iteration.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- spec.md
