# Dependency Upgrade One-by-One

Upgrade a single outdated package per iteration, fix breakages, and commit — safer than bulk npm update.

Source: https://loops.elorm.xyz/loops/dependency-upgrade-one-by-one
Category: Maintenance
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, claude-code, any
Tags: dependencies, maintenance, upgrades

## Steps

1. Pick one package

Run npm outdated. Pick the highest-impact outdated package (one only). Note its current and target version.

Check:

```sh
npm outdated
```

2. Upgrade and fix

Upgrade that single package. Fix type errors, API changes, and test failures caused by the bump.

Check:

```sh
npm test && npm run build
```

3. Commit bump

Commit with message like chore(deps): bump <package> to <version>.

## Exit Condition

Type: manual
Description: No outdated production dependencies remain (or user stops)
Max iterations: 15

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Dependency Upgrade One-by-One" loop.

Goal: critical outdated deps are upgraded with green tests
Max iterations: 15
Between iterations run: npm outdated && npm test && npm run build
Exit when: npm outdated shows no critical packages left or user stops

Step 1: Pick one outdated package, upgrade it, fix breakages, commit, and stop. One package per iteration.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/dependency-upgrade-one-by-one/README.md
- .cursor/loops/dependency-upgrade-one-by-one/kickoff.md
