# Loop Contract

Use this reference to design the loop itself.

## Definition

An agentic loop is a repeatable control system around an AI agent:

```text
goal -> context -> agent action -> real observation -> check -> memory update -> repeat or stop
```

The point is not to let the agent run forever. The point is to give the agent a
bounded way to keep working while reality pushes back through tests, logs, CI,
API responses, screenshots, diffs, reviewers, or explicit state.

## What a strong loop contains

Every serious loop needs:

- **Job:** the repeated work the loop owns.
- **Trigger:** when the loop starts: `manual`, `interval`, or `event`.
- **Scope:** files, branches, systems, endpoints, tickets, or data the agent may
  touch.
- **Observation:** the real feedback the agent reads after acting.
- **Primary check:** the command, verifier, policy, human review, or state that
  proves progress.
- **Exit condition:** the state where the loop stops successfully.
- **Hard stop:** max iterations, timeout, budget, repeated-failure rule, or
  approval gate.
- **Guardrails:** constraints that prevent cheating, damage, or silent failure.
- **Memory:** what gets recorded so the next pass does not restart cold.
- **Escalation:** when the loop stops and asks for human help.
- **Kickoff prompt:** the portable instruction that runs the loop.
- **Evidence:** what the final report shows to prove done-ness or blocker state.

## Quality bar

Great loops:

- make done-ness observable
- use one clear feedback signal before adding secondary checks
- keep the agent from weakening the check
- stop on repeated identical failures
- leave a run record
- are portable across agents when possible
- are specific about risk without turning normal ambiguity into a blocker
- preserve the agent's ability to reason from fresh observations

Weak loops:

- say "improve" or "finish" without a verifier
- rely on self-assessment
- let the agent edit tests, snapshots, baselines, schemas, or CI to pass
- lack max iterations or another hard stop
- retry the same failed move with no memory
- use a giant checklist instead of a control cycle
- hide several unrelated workflows under one title

## Local loop JSON shape

Use this shape when the repo expects `loop-definition.json`.

```json
{
  "sourceUrl": null,
  "downloadedCompatibleBundlePath": ".cursor/loops/example-loop/",
  "effectiveGuardrails": [
    "Do not modify the check command or exit criteria to force success",
    "Do not skip, disable, or bypass checks to pass the exit condition",
    "If stuck after several iterations, stop and report blockers instead of gaming metrics"
  ],
  "kickoffWithGuardrails": "Start the \"Example Loop\" loop...",
  "loop": {
    "id": "example-loop",
    "slug": "example-loop",
    "title": "Example Loop",
    "description": "Repeat a bounded task until a verifiable condition is met.",
    "category": "Testing",
    "triggerType": "manual",
    "triggerConfig": {
      "type": "manual"
    },
    "steps": [
      {
        "name": "Run check",
        "prompt": "Run the canonical check and capture exact output.",
        "shellCheck": "npm test"
      },
      {
        "name": "Fix root cause",
        "prompt": "Fix the smallest root cause. Do not weaken the check."
      },
      {
        "name": "Verify",
        "prompt": "Run the check again and compare against the exit condition.",
        "shellCheck": "npm test"
      }
    ],
    "exitCondition": {
      "type": "tests_pass",
      "command": "npm test",
      "description": "The canonical check exits 0",
      "maxIterations": 8
    },
    "kickoffPrompt": "Start the \"Example Loop\" loop.\n\nGoal: npm test exits 0\nMax iterations: 8\nBetween iterations run: npm test\nExit when: npm test exits 0\n\nSelf-pace this loop. After each iteration, run the check command, read the output, and only continue if the exit condition is not met. Stop when the exit condition passes or max iterations is reached. Give a short status update each pass.",
    "installBundle": {
      "files": []
    },
    "compatibleAgents": ["codex", "claude-code", "cursor", "any"],
    "bestForAgents": ["codex", "claude-code"],
    "author": "local",
    "authorSlug": "local",
    "authorOfficial": false,
    "source": "local",
    "tags": ["testing"],
    "guardrails": [],
    "examples": []
  }
}
```

Read top-level `effectiveGuardrails` first. Some loop sources duplicate
guardrails in `loop.guardrails`; treat that as metadata unless the local runtime
requires it.

## Trigger guidance

Use `manual` when a human should choose the moment.

Use `interval` for watch duties, PR babysitting, CI polling, maintenance scans,
or deploy verification.

Use `event` when a state change should automatically trigger verification, such
as file edit, pre-commit, merge, deploy, or PR update.

Start with manual unless the user explicitly needs scheduled or event-based
behavior. A weak manual loop is easier to inspect than a weak scheduled loop.

## Exit condition guidance

Good exit conditions are concrete:

- `npm test` exits 0.
- `npm run lint && npx tsc --noEmit` exits 0.
- CI reports green for the current branch or PR.
- OpenAPI or JSON Schema validation passes.
- A checked checklist count reaches zero.
- A named reviewer approves the result.

Manual exit conditions are acceptable only when the semantic state is still
clear. "All watched PRs are green, rebased, or escalated" is better than "PRs
look fine."

## Guardrail guidance

Default guardrails:

- Do not modify the check command or exit criteria to force success.
- Do not skip, disable, or bypass checks to pass the exit condition.
- If stuck after several iterations, stop and report blockers instead of gaming
  metrics.

Add risk-specific guardrails when relevant:

- Do not weaken tests, assertions, snapshots, baselines, schemas, or policies.
- Prefer fixing production code over patching tests.
- Do not touch production credentials or production data.
- Pause for approval before deploys, database writes, billing actions, email
  sends, or irreversible deletion.
- Stop after the same failure repeats twice unless a new hypothesis or evidence
  source is available.
- Keep a run log with command, result, diff summary, and stop reason.

## Memory guidance

Memory should be durable and small:

- `.loops/run-log.md` for command results and iteration notes.
- `.loops/reflexion.md` for failed debugging hypotheses.
- `.ralph/guardrails.md` for repeated failure signs.
- Issue, PR, CI, deployment, and artifact IDs when external systems are in play.
- Structured JSON only when another tool will read it.

Record facts, not transcripts:

- attempted action
- evidence returned
- change made
- failure repeated or resolved
- hypothesis ruled out
- next pass should avoid
- stop reason

## Validation questions

Before shipping a loop, answer:

- Can the agent observe whether it made progress?
- Is there one primary verifier?
- Is there a hard stop?
- Could the agent pass by editing the check?
- Does the loop explain when to escalate?
- Does it preserve useful autonomy?
- Are Codex and Claude Code compatibility claims honest?
- Is the kickoff prompt enough to run without hidden context?
