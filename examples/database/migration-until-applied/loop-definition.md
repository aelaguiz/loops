# Migration Until Applied

Run database migrations, fix schema issues, and loop until migrations apply cleanly in dev.

Source: https://loops.elorm.xyz/loops/migration-until-applied
Category: Database
Trigger: manual
Trigger config: {"type":"manual"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: cursor
Compatible agents: cursor, claude-code
Tags: database, prisma, migrations

## Steps

1. Run migrations

Apply pending migrations with the project's migration command.

Check:

```sh
npx prisma migrate dev
```

2. Fix schema errors

If migration fails, fix schema or SQL, regenerate client if needed, and retry.

3. Verify

Confirm migration history is consistent and app still starts.

Check:

```sh
npx prisma migrate status
```

## Exit Condition

Type: tests_pass
Description: All migrations applied with clean status

Command:

```sh
npx prisma migrate status
```
Max iterations: 6

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
Start the "Migration Until Applied" loop.

Goal: all database migrations apply cleanly
Max iterations: 6
Between iterations run: npx prisma migrate status
Exit when: migrate status shows no pending failures

Step 1: Run migrations. Fix schema or SQL errors, then repeat until status is clean.

Self-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/migration-until-applied/README.md
- .cursor/loops/migration-until-applied/kickoff.md
