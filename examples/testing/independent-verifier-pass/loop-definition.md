# Independent Verifier Pass

When implementation claims done, a separate verifier pass runs build, lint, and tests with no access to the implementer's rationale.

Source: https://loops.elorm.xyz/loops/independent-verifier-pass
Category: Testing
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code
Compatible agents: claude-code, cursor
Tags: verification, testing, letitloop

## Steps

1. Run verifier checks

As an independent verifier, run build, lint, and tests. Do not assume the prior pass was correct.

Check:

```sh
npm run build && npm run lint && npm test
```

2. Report gaps

List every failing check with file paths and error excerpts. No self-reporting — only command output counts.

3. Fix or hand back

If failures exist, fix them or produce a concise failure report for the implementer to continue.

## Exit Condition

Type: tests_pass
Description: Build, lint, and tests all pass under independent verification

Command:

```sh
npm run build && npm run lint && npm test
```
Max iterations: 8

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green

## Kickoff Prompt

```
Start the "Independent Verifier Pass" loop.

Goal: build, lint, and tests pass under independent verification
Max iterations: 8
Between iterations run: npm run build && npm run lint && npm test
Exit when: all verifier commands exit 0

Step 1: Run build, lint, and tests as a verifier. Trust only command output, not prior claims.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
- Do not weaken, delete, or skip tests to make the suite pass
- Do not replace real assertions with trivial always-pass tests
- Prefer fixing production code over patching tests to go green
```

## Provided Files

- .cursor/loops/independent-verifier-pass/README.md
- .cursor/loops/independent-verifier-pass/kickoff.md
