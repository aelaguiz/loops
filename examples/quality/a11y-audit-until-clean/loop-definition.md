# A11y Audit Until Clean

Run automated accessibility checks on changed routes, fix violations, and repeat until the audit is clean.

Source: https://loops.elorm.xyz/loops/a11y-audit-until-clean
Category: Quality
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, claude-code, any
Tags: a11y, quality, frontend

## Steps

1. Run a11y audit

Run axe, pa11y, or eslint-plugin-jsx-a11y on changed pages. List violations with selectors.

Check:

```sh
npm run test:a11y
```

2. Fix violations

Fix labels, contrast, focus order, and ARIA roles. Prefer semantic HTML over aria hacks.

## Exit Condition

Type: tests_pass
Description: Accessibility audit reports zero violations

Command:

```sh
npm run test:a11y
```
Max iterations: 8

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "A11y Audit Until Clean" loop.

Goal: zero serious accessibility violations on changed UI
Max iterations: 8
Between iterations run: npm run test:a11y
Exit when: a11y audit exits 0

Step 1: Run the a11y audit on changed routes. Fix each violation, prioritizing keyboard and screen reader issues.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/a11y-audit-until-clean/README.md
- .cursor/loops/a11y-audit-until-clean/kickoff.md
