# Examples And Anti-Patterns

Use these examples to calibrate judgment. Do not turn them into a lookup table.

## Strong small loop

```text
Title: Test Until Green
Goal: all tests pass
Trigger: manual
Observation: `npm test` output
Exit: `npm test` exits 0
Hard stop: 10 iterations
Guardrail: do not weaken, skip, or delete tests
Memory: short status after each pass
Escalation: same failure repeats after several attempts
```

Why it works: the feedback signal is real, the exit condition is observable,
and the guardrail blocks the obvious cheating path.

## Strong watch loop

```text
Title: PR Babysitter
Goal: watched PRs are green, current, or escalated
Trigger: interval, every 15 minutes
Observation: GitHub PR list and check status
Exit: each watched PR is green/current or has a clear blocker comment
Hard stop: max iterations or repeated failure
Guardrail: do not force-push or resolve product conflicts without approval
```

Why it works: interval behavior is justified because the job is watch duty. The
loop has a human-facing escalation state instead of pretending every PR problem
is fixable by the agent.

## Strong learning loop

```text
Title: Reflexion Debug Loop
Goal: the failing repro passes
Trigger: manual
Observation: minimal repro or failing test output
Memory: append what was tried, what failed, and one avoided hypothesis
Exit: repro command exits 0
Hard stop: 8 iterations
```

Why it works: the loop records enough memory to avoid repeating itself, but it
does not store a giant transcript.

## Anti-pattern: vague improvement loop

```text
Goal: improve the codebase
Exit: when the code looks better
Guardrails: be careful
```

Why it fails: the agent cannot observe done-ness. This should become a tighter
loop such as lint/typecheck, dead-code cleanup, coverage threshold, PR review,
or docs sync.

## Anti-pattern: check-gaming loop

```text
Goal: make tests pass
Steps:
1. Run tests.
2. If tests fail, update tests.
3. Re-run tests.
```

Why it fails: the loop does not distinguish legitimate test updates from
weakening the proof. Add guardrails that prefer production-code fixes and block
skipping, deleting, weakening, or replacing assertions unless the test is
provably wrong.

## Anti-pattern: forever watch loop

```text
Trigger: interval
Max iterations: none
Escalation: none
```

Why it fails: scheduled loops still need cost and stop controls. Add max
iterations per run, idle behavior, repeated-failure escalation, and notification
rules.

## Anti-pattern: overfit package-manager loop

```text
Goal: fix all project checks
Check: npm test && npm run lint && npm run build
Instruction: always use npm
```

Why it fails: package-manager choice is often repo-specific. If the loop is
meant to travel, say "use the repo's canonical test/lint/build commands" and
only name `npm` in a local instance.

## Anti-pattern: fake interactivity

```text
Before doing anything, ask the user to choose:
1. Trigger type
2. Exit condition type
3. Agent type
4. Guardrail profile
5. Output schema
```

Why it fails: it makes the user classify internal design choices. A better loop
author reads the request, drafts a reasonable v0, and asks only about decisions
that materially change safety or utility.

## Refinement example

User feedback:

```text
This loop kept saying the PR was done before CI finished.
```

Good refinement:

- Patch the exit condition to require completed CI status, not merely pushed
  changes.
- Patch the kickoff prompt to wait for or poll checks.
- Add a stop reason for repeated CI infrastructure failures.
- Leave unrelated steps alone.

Weak refinement:

- Add "be more careful" to the guardrails.
- Add three more reviewers even though the failure was an exit-condition bug.
- Rewrite the whole loop into a PR orchestration framework.

## Final test

Before shipping, ask:

- Would this loop still work if the project used a different stack?
- Would it stop safely when the environment is down?
- Could the agent pass by changing the proof?
- Is the example teaching a principle or secretly becoming the rule?
