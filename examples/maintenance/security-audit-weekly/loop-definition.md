# Security Audit Weekly

Weekly npm audit scan, triage vulnerabilities by severity, and propose or apply safe patches.

Source: https://loops.elorm.xyz/loops/security-audit-weekly
Category: Maintenance
Trigger: interval
Trigger config: {"interval":"7d"}
Author: loops! (loops)
Created: Jun 14, 2026
Best for: claude-code
Compatible agents: cursor, claude-code
Tags: security, npm, audit, maintenance

## Steps

1. Run npm audit

Run npm audit and capture critical, high, and moderate findings.

Check:

```sh
npm audit --json
```

2. Triage findings

Group vulnerabilities by severity and exploitability. Flag dev-only vs production exposure.

3. Propose fixes

Recommend npm audit fix, targeted overrides, or dependency bumps. Note breaking changes.

## Exit Condition

Type: manual
Description: Weekly security audit summary delivered with remediation plan

## Guardrails

- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics

## Kickoff Prompt

```
/loop 7d Start the "Security Audit Weekly" loop.

Goal: deliver a weekly npm audit summary with a remediation plan.
Between iterations run: npm audit --json
Exit when: summary is posted with prioritized fixes.

Step 1: Run npm audit, triage by severity, and propose safe remediation steps.

Guardrails (do not skip):
- Do not modify the check command or exit criteria to force success
- Do not skip, disable, or bypass checks to pass the exit condition
- If stuck after several iterations, stop and report blockers instead of gaming metrics
```

## Provided Files

- .cursor/loops/security-audit-weekly/README.md
- .cursor/loops/security-audit-weekly/kickoff.md
