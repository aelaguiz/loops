# Dependency Audit Weekly

Weekly loop to check outdated dependencies, propose safe upgrades, and open a summary.

Source: https://loops.elorm.xyz/loops/dependency-audit-weekly
Category: Maintenance
Trigger: interval
Trigger config: {"interval":"7d"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code
Compatible agents: cursor, claude-code
Tags: dependencies, maintenance, security

## Steps

1. List outdated packages

Run npm outdated and summarize major vs patch updates.

Check:

```sh
npm outdated || true
```

2. Propose upgrades

Recommend safe upgrades. Flag breaking changes and required code changes.

## Exit Condition

Type: manual
Description: Weekly audit summary delivered

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
/loop 7d Start the "Dependency Audit Weekly" loop.

Goal: deliver a weekly dependency audit summary.
Between iterations run: npm outdated || true
Exit when: summary is posted with recommended upgrades.

Step 1: Run npm outdated, categorize updates, and propose a safe upgrade plan.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/dependency-audit-weekly/README.md
- .cursor/loops/dependency-audit-weekly/kickoff.md
