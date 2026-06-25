# loop-kit

Add an autonomous Loop Engineering triage loop to any repo.

Source: https://loops.elorm.xyz/loops/loop-kit-mql1vea1
Category: Review
Trigger: manual
Trigger config: {"type":"manual"}
Author: Heisenberg (heisenberg)
Created: Jun 19, 2026
Best for: claude-code
Compatible agents: claude-code

## Steps

1. Run loop

/plugin marketplace add yuzhiquan/loop-kit
/plugin install loop-kit@loop-kit

## Exit Condition

Type: manual
Description: Loop goal achieved

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
/plugin marketplace add yuzhiquan/loop-kit
/plugin install loop-kit@loop-kit

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/loop-kit-mql1vea1/README.md
- .cursor/loops/loop-kit-mql1vea1/kickoff.md
