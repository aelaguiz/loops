# Agentic Loops

Last researched: 2026-06-25

This guide explains loops as an agentic programming technique, using the local
examples in `../examples/` and current external material from research papers,
platform docs, and practitioner writeups. Source notes are saved in
[references/agentic-loop-reference-materials.md](./references/agentic-loop-reference-materials.md).

## Bottom Line

An agentic loop is a repeatable control system around an AI agent:

```text
goal -> context -> agent action -> real observation -> check -> memory update -> repeat or stop
```

The point is to move from "I keep prompting the agent" to "I design the system
that prompts, checks, remembers, and stops." A strong loop is not just an agent
with permission to run forever. It has a clear job, a trigger, a bounded action
space, a real feedback signal, a stop condition, a run record, and guardrails
that prevent the agent from faking success.

The local loop examples follow that model. Each loop definition usually includes
a trigger, ordered steps, optional shell checks, an exit condition, a maximum
iteration count, guardrails, compatible agents, and a kickoff prompt.

## What A Loop Is

A loop is a workflow that lets an agent keep working after the first response.
Instead of producing one answer and stopping, the agent repeatedly:

1. Looks at the current goal and state.
2. Chooses the next action.
3. Uses a tool, edits a file, runs a command, asks a question, or delegates.
4. Reads the result.
5. Decides whether the goal is done.
6. Continues, stops, or escalates.

For coding agents, the most familiar version is:

```text
write code -> run tests -> read failure -> fix root cause -> run tests again
```

That shape appears in the local
[Test Until Green](../examples/testing/test-until-green/loop-definition.md),
[Build Until Green](../examples/testing/build-until-green/loop-definition.md),
[Lint and Typecheck Fix](../examples/testing/lint-typecheck-fix/loop-definition.md),
and [E2E Until Green](../examples/testing/e2e-until-green/loop-definition.md)
examples.

## What Makes This Agentic

A normal script repeats fixed instructions. An agentic loop repeats a goal-driven
process where the model can choose the next step based on observations. The
agentic part is the adaptive decision inside the loop.

The important distinction:

| Technique | What repeats | Who decides the next step | Best fit |
| --- | --- | --- | --- |
| One-shot prompt | Nothing | Human | Simple generation or explanation |
| Script | Fixed commands | Programmer at design time | Deterministic tasks |
| Workflow | Fixed path with gates | Code path | Known multi-step processes |
| Agentic loop | Reason, act, observe, check | Agent plus harness | Tasks where the next step depends on feedback |

Loops are useful when the task cannot be solved reliably in one pass, but the
agent can get feedback from the environment. Tests, linters, CI status, API
responses, screenshots, traces, issue trackers, and human approvals are all
feedback sources.

## Why Loops Work

Loops work because they turn model output into a conversation with reality.

The ReAct research line showed the core mechanism: interleave reasoning with
actions, then use observations to update the next step. Reflexion added a memory
move: after failed attempts, the agent writes down what went wrong and uses that
text in later trials. Self-Refine showed a generator-feedback-refiner pattern
where outputs improve over multiple passes. Production agent docs from
Anthropic, OpenAI, AWS, Google Cloud, LangGraph, and Hugging Face all describe
the same basic pattern: act, observe, evaluate, and continue until a stop
condition is reached.

For programming, the feedback is unusually strong. Code can be compiled, tested,
linted, diffed, benchmarked, deployed to staging, checked against contracts, and
reviewed. That makes loops especially effective for software work.

## The Core Loop Skeleton

A robust loop can be expressed as a small control structure:

```text
load goal
load persistent state
load guardrails

for iteration in 1..max_iterations:
  assemble context from goal, state, guardrails, and latest observation
  let the agent choose and perform the next useful action
  capture observation from tools, tests, files, CI, APIs, or humans
  append a run record

  if verifier says the exit condition is satisfied:
    stop with success and evidence

  if failure policy says the loop is stuck, unsafe, over budget, or repeating:
    stop with blocker, evidence, and next recommendation

  update state so the next pass does not restart cold
```

In practice there are often several loops nested together:

| Loop layer | What it controls | Example |
| --- | --- | --- |
| Tool loop | One model turn can call tools until final output | OpenAI Agents SDK runner loop |
| Work loop | Repeat task work until a check passes | `npm test` until green |
| Evaluator loop | Generate, critique, revise | AWS evaluator reflect-refine |
| Schedule loop | Wake up on a timer or event | PR babysitter every 15 minutes |
| Learning loop | Record failures so future passes improve | Reflexion debug loop |
| Multi-agent loop | Orchestrator assigns work to agent loops | implementer plus verifier |

## What Great Looks Like

A well-designed loop has these attributes.

| Attribute | What it means | Why it matters |
| --- | --- | --- |
| Evaluable goal | The goal can be checked by a command, contract, policy, reviewer, or explicit state | Prevents vague "done" claims |
| Bounded scope | The loop knows which files, systems, branches, tickets, or endpoints are in play | Reduces accidental damage and context bloat |
| Real feedback | The loop reads tests, logs, CI, screenshots, API responses, traces, or human decisions | Grounds the agent in evidence |
| Independent verification | The checker is separate from the maker when risk is meaningful | Reduces optimistic self-grading |
| Hard stop | Max iterations, budget, timeout, repeated-failure detection, or human checkpoint | Prevents runaway loops |
| Non-gaming guardrails | The agent cannot weaken the check, skip tests, edit success criteria, or hide failures | Keeps success meaningful |
| Durable memory | The loop records attempts, decisions, failures, and next actions outside the transient chat | Prevents repeat mistakes |
| Minimal tool set | The agent has enough tools to solve the job, not every tool available | Lowers blast radius |
| Reversibility | Work happens on a branch, worktree, sandbox, staging target, or rollback path | Makes autonomy safer |
| Observability | There is a readable run log with commands, results, diffs, and stop reasons | Makes review and debugging possible |
| Escalation path | The loop knows when to stop and ask a human | Avoids grinding on impossible work |
| Cost awareness | The loop limits turns, tokens, parallel agents, and expensive tools | Keeps automation from becoming invisible spend |

Net: a great loop is boring in the right ways. It repeats only what should be
repeated, stops for the right reasons, and leaves enough evidence for a human to
trust or reject the result.

## The Local Loop Format

Each local example has a `loop-definition.md` and `loop-definition.json`.

The JSON shape usually has these fields:

| Field | Meaning |
| --- | --- |
| `sourceUrl` | Original loops! page, when present |
| `downloadedCompatibleBundlePath` | Intended install path for compatible bundles |
| `effectiveGuardrails` | Guardrails actually injected into the kickoff prompt |
| `kickoffWithGuardrails` | Full prompt to paste into the agent |
| `loop.id` | Stable loop identifier |
| `loop.slug` | URL and folder-friendly name |
| `loop.title` | Human-readable loop name |
| `loop.description` | What the loop is for |
| `loop.category` | Domain, such as Testing, CI, Maintenance, Review |
| `loop.triggerType` | `manual`, `interval`, or `event` |
| `loop.triggerConfig` | Trigger details, such as `{"interval":"15m"}` |
| `loop.steps` | Ordered agent actions; each step has a `name`, `prompt`, and sometimes `shellCheck` |
| `loop.exitCondition` | Exit type, command, description, and sometimes `maxIterations` |
| `loop.kickoffPrompt` | Base prompt before effective guardrails are appended |
| `loop.installBundle` | Optional files to install with the loop |
| `loop.compatibleAgents` | Agents expected to run it |
| `loop.bestForAgents` | Best-fit agents |
| `loop.tags` | Search and grouping tags |
| `loop.examples` | Example use cases, when present |

Local inventory as of 2026-06-25:

| Dimension | Values |
| --- | --- |
| Total loops | 42 |
| Trigger types | 33 manual, 6 interval, 3 event |
| Biggest category | Testing, 14 loops |
| Exit condition types | 17 `tests_pass`, 6 `lint_clean`, 5 `ci_green`, 13 `manual`, 1 `max_iterations` |
| Common guardrails | Do not change checks, do not skip checks, stop and report blockers if stuck |

One important nuance: most local JSON files put reusable guardrails in
top-level `effectiveGuardrails`. A few also duplicate them in
`loop.guardrails`. Consumers should read `effectiveGuardrails` first and treat
`loop.guardrails` as loop metadata.

## Trigger Design

The trigger answers "when does this loop start?"

Manual loops start when a human kicks them off. Use them for scoped work where a
person chooses the moment, such as a bug fix, test pass, migration, review, or
feature implementation.

Interval loops run on a cadence. Use them for watch duties, triage, and
maintenance. Examples:

- [CI Failure Watcher](../examples/ci/ci-failure-watcher/loop-definition.md)
- [PR Babysitter](../examples/ci/pr-babysitter/loop-definition.md)
- [PR Watch Loop](../examples/ci/pr-watch-loop/loop-definition.md)
- [Deploy Verification Loop](../examples/devops/deploy-verification-loop/loop-definition.md)
- [Dependency Audit Weekly](../examples/maintenance/dependency-audit-weekly/loop-definition.md)
- [Security Audit Weekly](../examples/maintenance/security-audit-weekly/loop-definition.md)

Event loops react to a local or platform event. Use them when a state change
should automatically trigger verification. Examples:

- [Pre-Commit Guard](../examples/testing/pre-commit-guard/loop-definition.md)
- [Post-Edit Test Guard](../examples/testing/post-edit-test-guard/loop-definition.md)
- [Post-Merge Regression Guard](../examples/testing/post-merge-regression-guard/loop-definition.md)

## Exit Condition Design

The exit condition answers "what proves the loop is done?"

Good exit conditions are concrete:

- `npm test` exits 0.
- `npm run lint && npx tsc --noEmit` exits 0.
- `gh pr checks --watch` reports success.
- `npx @redocly/cli lint openapi.yaml` passes.
- The count of incomplete spec items is zero.
- A human approves a risky action.

Weak exit conditions are vague:

- "Improve the code."
- "Make it better."
- "Clean up until it feels good."
- "Finish the feature."

Manual exit conditions are acceptable only when the loop still explains what
state the agent should look for. For example,
[Spec-First Ship](../examples/planning/spec-first-ship/loop-definition.md)
uses a semantic checklist: each pass completes one unchecked item in `spec.md`
until no unchecked items remain.

## Guardrails

Guardrails keep the loop from winning by cheating.

The local examples repeatedly use these guardrail families:

- Do not modify the check command or exit criteria to force success.
- Do not skip, disable, or bypass checks.
- Do not weaken tests or assertions to make the suite pass.
- Prefer fixing production code over patching tests.
- Stop and report blockers if stuck.

Additional guardrails worth adding for higher-risk loops:

- Do not run destructive commands outside the current repo.
- Do not touch production credentials or production data.
- Do not install new dependencies without naming why.
- Do not rewrite public APIs unless the spec explicitly requires it.
- Do not change generated lockfiles except as a direct result of a dependency action.
- Do not keep retrying the same failing approach after two identical failures.
- Pause for human approval before deploys, database writes, billing actions, email sends, or irreversible file deletion.
- Keep a run log with command, result, diff summary, and stop reason.

Guardrails should be close to execution. A sentence in a prompt helps, but
stronger loops also use branch protection, read-only files, sandboxed tools,
policy checks, tool approvals, CI gates, and human interrupts.

## Memory And State

Loops need memory because the agent context is temporary and can overflow.

Useful memory forms:

- A markdown run log, such as `.loops/run-log.md`.
- A failure reflection file, such as `.loops/reflexion.md`.
- A guardrail file, such as `.ralph/guardrails.md`.
- A task board, issue tracker, or Linear ticket.
- CI run IDs, PR numbers, deployment IDs, and artifact URLs.
- Structured JSON state for machines to read.

The local [Reflexion Debug Loop](../examples/debugging/reflexion-debug-loop/loop-definition.md)
uses a disk file to avoid repeating failed fixes. The
[Guardrails Learning Loop](../examples/automation/guardrails-learning-loop/loop-definition.md)
turns repeated failures into persistent guardrail signs.

Good memory records these facts:

- What was attempted.
- What evidence came back.
- What changed.
- What failed again.
- What hypothesis is now ruled out.
- What the next pass should avoid.
- Why the loop stopped.

Bad memory is a giant transcript. Summarize into durable facts the next pass can
use.

## Verification

A loop needs a verifier. Sometimes the verifier is a command. Sometimes it is a
human. Sometimes it is another model. Strong loops combine them.

Verification options:

| Verifier | Good for | Weakness |
| --- | --- | --- |
| Unit tests | Code behavior | May miss integration and UX issues |
| Typecheck/lint | Static quality | Can pass while behavior is wrong |
| Build | Packaging and compile health | May not cover runtime paths |
| E2E tests | User flows | Slower and often flaky |
| Visual regression | UI rendering | Needs stable baselines |
| API contract tests | Schema compatibility | Can miss business semantics |
| CI checks | Full project gates | Slower feedback |
| Reviewer subagent | Broader critique | Can be overconfident |
| Human review | Architecture, intent, risk | Expensive and bottlenecked |

The strongest pattern is "maker plus checker": one agent implements, another
agent or deterministic check reviews. This is the same idea as the AWS
evaluator-reflect-refine workflow and Anthropic's evaluator-optimizer pattern.

## Observability

Loops are hard to trust when they leave no trace. A loop should produce a run
record that answers:

- What triggered this run?
- What goal was it trying to satisfy?
- Which iteration is this?
- What did it read?
- What did it change?
- Which commands ran?
- What did the commands return?
- What evidence proves completion?
- What was skipped or deferred?
- Why did it stop?

For local coding loops, this can be a markdown file and `git diff`. For
production agent systems, use traces that capture model calls, tool calls,
handoffs, guardrail decisions, and final outputs.

## How To Use A Local Loop

1. Pick the loop closest to the job.
2. Read its `loop-definition.md`.
3. Replace placeholder commands, paths, branches, endpoints, and test names.
4. Make sure the exit condition is true, measurable, and safe.
5. Run in a branch, worktree, or sandbox when file edits are possible.
6. Paste the `kickoffWithGuardrails` prompt into the target agent.
7. Watch the first iteration to catch bad scope or missing tools.
8. Let it continue only while the observations show progress.
9. Review the final diff, run record, and evidence.
10. Keep useful loop-specific lessons in a durable file or turn them into a new guardrail.

Do not start by changing the loop machinery. Start by making the goal and check
specific.

## How To Design A New Loop

Use this checklist when authoring a new `loop-definition.json`.

1. Name the job.

   A good loop name is operational: "OpenAPI Sync Until Valid", "PR Babysitter",
   "Coverage Until Threshold". It says what repeats and what done means.

2. Define the goal.

   The goal should be a state, not a vibe. Prefer "all changed routes pass
   accessibility checks" over "improve accessibility".

3. Pick the trigger.

   Use `manual` for human-started work, `interval` for watch duties, and `event`
   for guard or lifecycle hooks.

4. Define the observation source.

   Decide what the agent will read after each action: command output, CI status,
   API response, screenshot, diff, log, issue state, or reviewer decision.

5. Choose the smallest tool set.

   Give the loop only the tools it needs. Add tools when failures prove a real
   gap.

6. Write the step sequence.

   Steps should be concrete enough to guide the agent but not so rigid that it
   cannot adapt to observations.

7. Add one primary check.

   The check command should be the loop's source of truth. Do not let the agent
   invent a different one mid-run.

8. Add hard limits.

   Include `maxIterations`, timeout, budget, repeated-failure stop, or human
   checkpoint.

9. Add anti-gaming guardrails.

   State what the agent must not change: tests, snapshots, baselines, schemas,
   exit criteria, CI config, or policy files.

10. Add memory.

   Tell the loop where to record attempts and what to preserve across passes.

11. Define escalation.

   Say exactly when to stop: same failure twice, missing credentials, destructive
   action needed, unclear product decision, flaky external service, or no
   measurable progress.

12. Dry-run on a low-risk repo.

   A loop is code-shaped. Test the loop itself before trusting it with important
   work.

## Minimal Loop Definition Template

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
        "prompt": "Run the canonical check and capture the exact output.",
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
    "compatibleAgents": ["cursor", "claude-code", "codex", "any"],
    "bestForAgents": ["codex"],
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

## Kickoff Prompt Template

```text
Start the "<loop title>" loop.

Goal: <specific goal>
Max iterations: <number>
Between iterations run: <canonical check command>
Exit when: <observable success state>

Step 1: <first concrete action>. If the exit condition is not met, use the
latest observation to choose the smallest useful next action, then repeat.

Self-pace this loop. After each iteration, run the check command, read the
output, and only continue if the exit condition is not met. Stop when the exit
condition passes or max iterations is reached. Give a short status update each
pass.

Guardrails:
- Do not modify the check command or exit criteria to force success.
- Do not skip, disable, or bypass checks to pass the exit condition.
- Do not weaken tests, assertions, baselines, or policies unless the user
  explicitly asks for that change.
- If the same failure repeats twice, stop and report the blocker with evidence.
```

## Pattern Catalog

### Test, Build, And Static Quality Loops

Use these when the feedback signal is a command exit code.

- [Test Until Green](../examples/testing/test-until-green/loop-definition.md)
- [Build Until Green](../examples/testing/build-until-green/loop-definition.md)
- [Lint and Typecheck Fix](../examples/testing/lint-typecheck-fix/loop-definition.md)
- [Format Until Clean](../examples/testing/format-until-clean/loop-definition.md)
- [Coverage Until Threshold](../examples/testing/coverage-until-threshold/loop-definition.md)
- [Autoloop TDD](../examples/testing/autoloop-tdd/loop-definition.md)
- [Knip Until Clean](../examples/maintenance/knip-until-clean/loop-definition.md)

Best fit:

- Local coding tasks.
- CI failures that reproduce locally.
- Refactors where success is easy to test.
- Type migrations.
- Formatting and dead-code removal.

Do not use blindly when tests are weak. Passing a weak test suite is evidence,
not proof.

### CI And PR Loops

Use these when the loop watches a remote system and reacts to status.

- [Fix CI Until Green](../examples/ci/fix-ci-until-green/loop-definition.md)
- [Ship PR Until Green](../examples/ci/ship-pr-until-green/loop-definition.md)
- [CI Failure Watcher](../examples/ci/ci-failure-watcher/loop-definition.md)
- [PR Babysitter](../examples/ci/pr-babysitter/loop-definition.md)
- [PR Watch Loop](../examples/ci/pr-watch-loop/loop-definition.md)

Best fit:

- Long-running CI.
- Pull requests that need repeated rebases or fixups.
- Repeated status checks where a human would otherwise keep polling.

Key risk:

- CI loops can create churn if they force-push, rebase, or modify PRs without a
  clear branch policy.

### Debugging And Learning Loops

Use these when the agent must avoid repeating failed hypotheses.

- [Reflexion Debug Loop](../examples/debugging/reflexion-debug-loop/loop-definition.md)
- [Investigation Script Loop](../examples/debugging/investigation-script-loop/loop-definition.md)
- [Guardrails Learning Loop](../examples/automation/guardrails-learning-loop/loop-definition.md)

Best fit:

- Bugs with a reproducible failing test.
- Unknown root causes.
- Repeated agent mistakes that should turn into durable guardrails.

Key risk:

- Bad reflections can poison later iterations. Keep memory factual and specific.

### Review And Verification Loops

Use these when the output needs critique before acceptance.

- [PR Self-Review](../examples/review/pr-self-review/loop-definition.md)
- [Independent Verifier Pass](../examples/testing/independent-verifier-pass/loop-definition.md)
- [De-Sloppify Pass](../examples/review/de-sloppify-pass/loop-definition.md)
- [loop-kit](../examples/review/loop-kit-mql1vea1/loop-definition.md)

Best fit:

- Diff review.
- Cleanup passes after implementation.
- Independent verification before claiming done.

Key risk:

- A reviewer agent is still an agent. For high-risk changes, require human
  review too.

### API, Contract, And Schema Loops

Use these when compatibility is defined by a schema or contract.

- [API Contract Until Match](../examples/api/api-contract-until-match/loop-definition.md)
- [OpenAPI Sync Until Valid](../examples/api/openapi-sync-until-valid/loop-definition.md)
- [Migration Until Applied](../examples/database/migration-until-applied/loop-definition.md)

Best fit:

- OpenAPI drift.
- Contract test failures.
- Database migration validation.

Key risk:

- Contract checks can pass while product semantics are wrong. Pair with tests or
  human review for behavior changes.

### UI, Accessibility, And Visual Loops

Use these when the feedback signal is visual, browser-based, or accessibility
focused.

- [E2E Until Green](../examples/testing/e2e-until-green/loop-definition.md)
- [Visual Regression Until Match](../examples/testing/visual-regression-until-match/loop-definition.md)
- [A11y Audit Until Clean](../examples/quality/a11y-audit-until-clean/loop-definition.md)
- [Staging Smoke Test](../examples/devops/staging-smoke-test/loop-definition.md)

Best fit:

- Browser flows.
- Accessibility audits.
- Screenshot comparisons.
- Staging smoke checks.

Key risk:

- Visual loops need stable baselines and screenshots. Without them, the loop can
  optimize toward noise.

### Maintenance And Security Loops

Use these for recurring hygiene work.

- [Dependency Audit Weekly](../examples/maintenance/dependency-audit-weekly/loop-definition.md)
- [Dependency Upgrade One-by-One](../examples/maintenance/dependency-upgrade-one-by-one/loop-definition.md)
- [Security Audit Weekly](../examples/maintenance/security-audit-weekly/loop-definition.md)
- [npm Audit Fix Loop](../examples/security/npm-audit-fix-loop/loop-definition.md)
- [Docs Sync After Edits](../examples/maintenance/docs-sync-after-edits/loop-definition.md)
- [Changelog Sync After Ship](../examples/docs/changelog-sync-after-ship/loop-definition.md)

Best fit:

- Small recurring upgrades.
- Security triage.
- Documentation drift.
- Changelog upkeep.

Key risk:

- Dependency and security loops can introduce large behavior changes. Upgrade
  one package at a time and verify.

### Planning And Execution Loops

Use these when the loop works from an explicit checklist or project artifact.

- [Spec-First Ship](../examples/planning/spec-first-ship/loop-definition.md)
- [Ralph Story Executor](../examples/automation/ralph-story-executor/loop-definition.md)

Best fit:

- Specs with checkboxes.
- Product requirements with explicit acceptance criteria.
- Story-by-story implementation.

Key risk:

- A vague spec creates vague loop behavior. The loop inherits the quality of the
  plan.

### DevOps And Deployment Loops

Use these when the loop verifies service health after change.

- [Deploy Verification Loop](../examples/devops/deploy-verification-loop/loop-definition.md)
- [Staging Smoke Test](../examples/devops/staging-smoke-test/loop-definition.md)

Best fit:

- Post-deploy health checks.
- Staging verification.
- Smoke tests after release.

Key risk:

- Production actions need human approval, rollback plans, and strong audit logs.

## Full Local Example Catalog

| Category | Loop | Trigger | Exit type | Main check | Local definition |
| --- | --- | --- | --- | --- | --- |
| API | API Contract Until Match | manual | tests_pass | `npm run test:contract` | [md](../examples/api/api-contract-until-match/loop-definition.md) |
| API | OpenAPI Sync Until Valid | manual | lint_clean | `npx @redocly/cli lint openapi.yaml` | [md](../examples/api/openapi-sync-until-valid/loop-definition.md) |
| Automation | Guardrails Learning Loop | manual | tests_pass | `npm test && npm run lint` | [md](../examples/automation/guardrails-learning-loop/loop-definition.md) |
| Automation | Ralph Story Executor | manual | manual | `cat .ralph/prd.json | grep -c '"passes": false' || true` | [md](../examples/automation/ralph-story-executor/loop-definition.md) |
| CI | CI Failure Watcher | interval | ci_green | `gh run list --branch $(git branch --show-current) --limit 1 --json conclusion -q '.[0].conclusion'` | [md](../examples/ci/ci-failure-watcher/loop-definition.md) |
| CI | Fix CI Until Green | manual | ci_green | `gh run list --branch $(git branch --show-current) --limit 1 --json conclusion -q '.[0].conclusion'` | [md](../examples/ci/fix-ci-until-green/loop-definition.md) |
| CI | PR Babysitter | interval | manual | none | [md](../examples/ci/pr-babysitter/loop-definition.md) |
| CI | PR Watch Loop | interval | manual | none | [md](../examples/ci/pr-watch-loop/loop-definition.md) |
| CI | Ship PR Until Green | manual | ci_green | `gh pr checks --watch` | [md](../examples/ci/ship-pr-until-green/loop-definition.md) |
| Database | Migration Until Applied | manual | tests_pass | `npx prisma migrate status` | [md](../examples/database/migration-until-applied/loop-definition.md) |
| Debugging | Investigation Script Loop | manual | manual | none | [md](../examples/debugging/investigation-script-loop/loop-definition.md) |
| Debugging | Reflexion Debug Loop | manual | tests_pass | `npm test -- --testNamePattern=<failing-test>` | [md](../examples/debugging/reflexion-debug-loop/loop-definition.md) |
| DevOps | Deploy Verification Loop | interval | ci_green | `curl -fsS https://your-app.example/health` | [md](../examples/devops/deploy-verification-loop/loop-definition.md) |
| DevOps | Staging Smoke Test | manual | ci_green | `npm run smoke:staging` | [md](../examples/devops/staging-smoke-test/loop-definition.md) |
| Docs | Changelog Sync After Ship | manual | manual | none | [md](../examples/docs/changelog-sync-after-ship/loop-definition.md) |
| Git | Merge Conflict Resolver | manual | tests_pass | `git rebase --continue 2>/dev/null; npm test` | [md](../examples/git/merge-conflict-resolver/loop-definition.md) |
| Maintenance | Dependency Audit Weekly | interval | manual | none | [md](../examples/maintenance/dependency-audit-weekly/loop-definition.md) |
| Maintenance | Dependency Upgrade One-by-One | manual | manual | none | [md](../examples/maintenance/dependency-upgrade-one-by-one/loop-definition.md) |
| Maintenance | Docs Sync After Edits | manual | manual | none | [md](../examples/maintenance/docs-sync-after-edits/loop-definition.md) |
| Maintenance | Knip Until Clean | manual | lint_clean | `npx knip` | [md](../examples/maintenance/knip-until-clean/loop-definition.md) |
| Maintenance | Security Audit Weekly | interval | manual | none | [md](../examples/maintenance/security-audit-weekly/loop-definition.md) |
| Performance | Bundle Size Budget | manual | tests_pass | `npm run size-limit` | [md](../examples/performance/bundle-size-budget/loop-definition.md) |
| Planning | Spec-First Ship | manual | manual | none | [md](../examples/planning/spec-first-ship/loop-definition.md) |
| Quality | A11y Audit Until Clean | manual | tests_pass | `npm run test:a11y` | [md](../examples/quality/a11y-audit-until-clean/loop-definition.md) |
| Review | De-Sloppify Pass | manual | lint_clean | `npm run lint && npm test` | [md](../examples/review/de-sloppify-pass/loop-definition.md) |
| Review | loop-kit | manual | manual | none | [md](../examples/review/loop-kit-mql1vea1/loop-definition.md) |
| Review | PR Self-Review | manual | max_iterations | none | [md](../examples/review/pr-self-review/loop-definition.md) |
| Security | npm Audit Fix Loop | manual | lint_clean | `npm audit --audit-level=high` | [md](../examples/security/npm-audit-fix-loop/loop-definition.md) |
| Testing | Autoloop TDD | manual | tests_pass | `npm test` | [md](../examples/testing/autoloop-tdd/loop-definition.md) |
| Testing | Build Until Green | manual | tests_pass | `npm run build` | [md](../examples/testing/build-until-green/loop-definition.md) |
| Testing | cardxc | manual | manual | none | [md](../examples/testing/cardxc-mqi8i0wc/loop-definition.md) |
| Testing | Coverage Until Threshold | manual | tests_pass | `npm test -- --coverage` | [md](../examples/testing/coverage-until-threshold/loop-definition.md) |
| Testing | E2E Until Green | manual | tests_pass | `npm run test:e2e` | [md](../examples/testing/e2e-until-green/loop-definition.md) |
| Testing | Flaky Test Triage | manual | manual | none | [md](../examples/testing/flaky-test-triage/loop-definition.md) |
| Testing | Format Until Clean | manual | lint_clean | `npm run format && git diff --quiet` | [md](../examples/testing/format-until-clean/loop-definition.md) |
| Testing | Independent Verifier Pass | manual | tests_pass | `npm run build && npm run lint && npm test` | [md](../examples/testing/independent-verifier-pass/loop-definition.md) |
| Testing | Lint and Typecheck Fix | manual | lint_clean | `npm run lint && npx tsc --noEmit` | [md](../examples/testing/lint-typecheck-fix/loop-definition.md) |
| Testing | Post-Edit Test Guard | event | tests_pass | `npm test -- --findRelatedTests` | [md](../examples/testing/post-edit-test-guard/loop-definition.md) |
| Testing | Post-Merge Regression Guard | event | tests_pass | `npm run test:smoke` | [md](../examples/testing/post-merge-regression-guard/loop-definition.md) |
| Testing | Pre-Commit Guard | event | tests_pass | `npm test` | [md](../examples/testing/pre-commit-guard/loop-definition.md) |
| Testing | Test Until Green | manual | tests_pass | `npm test` | [md](../examples/testing/test-until-green/loop-definition.md) |
| Testing | Visual Regression Until Match | manual | tests_pass | `npx playwright test --grep @visual` | [md](../examples/testing/visual-regression-until-match/loop-definition.md) |

## Use Cases

Loops are strongest for work with repeated feedback and measurable progress:

- Coding: test-fix cycles, type migrations, build failures, refactors, bug reproduction.
- Review: self-review, independent verification, cleanup passes, security review.
- CI: failing run triage, branch rebasing, PR babysitting, status monitoring.
- Maintenance: dependency updates, security audit triage, dead-code cleanup, docs sync.
- Quality: accessibility checks, visual regression, E2E stabilization, bundle budgets.
- API and data: contract tests, OpenAPI drift, schema migration, database migration verification.
- DevOps: deploy health checks, staging smoke tests, rollback decision support.
- Planning: spec checklist execution, story-by-story implementation.
- Research and analysis: gather sources, evaluate completeness, refine the report until criteria pass.
- Operations: issue triage, alert triage, scheduled summaries, queue grooming.

The common thread is not "AI can do it." The common thread is "the loop can see
whether it made progress."

## When Not To Use A Loop

Do not use a loop when:

- A one-shot answer is enough.
- The task is high-stakes and the loop would act without approval.
- The agent cannot observe whether it is making progress.
- The exit condition is subjective and no reviewer is available.
- The action is irreversible or expensive.
- The task requires a product decision, not execution.
- The loop would have broad write access with weak rollback.
- The system has no budget limit, timeout, or stop condition.
- The input context is too unstable for the agent to reason reliably.
- Deterministic, auditable output is required and a fixed pipeline can do the job.

Loops add power, but they also add cost, latency, nondeterminism, and failure
surface. Use the simplest thing that satisfies the job.

## Common Failure Modes

| Failure mode | Symptom | Prevention |
| --- | --- | --- |
| Vague goal | Agent wanders or claims done early | Write an observable success state |
| No hard stop | Loop runs until budget or patience runs out | Add max iterations, timeout, and repeated-failure stop |
| Self-grading | Agent says its own work is correct | Use tests, external verifier, or human review |
| Check gaming | Agent edits tests, snapshots, or exit criteria | Make checks explicit and protected |
| Tool overreach | Agent touches unrelated files or systems | Limit tools, scope, branch, and permissions |
| Context rot | Agent forgets prior attempts or repeats itself | Summarize durable memory after each pass |
| Hidden state | Human cannot tell what happened | Require run records and diffs |
| Parallel collision | Multiple agents edit same files | Use branches or worktrees |
| Flaky feedback | Agent chases nondeterministic failures | Re-run, classify, and isolate flakes |
| External dependency failure | Loop cannot reach CI, API, registry, or staging | Stop with blocker after retries |
| Human bottleneck | Review becomes slower than implementation | Ask the loop for evidence, not just summaries |
| Over-automation | Loop handles decisions it should escalate | Define approval gates |

## Measuring Loop Quality

Measure the loop, not just the model.

Useful metrics:

- Success rate by loop type.
- Average iterations to success.
- Stop reasons: success, max iterations, blocker, human approval, budget, unsafe action.
- Repeated-failure rate.
- Number of files touched per run.
- Test pass rate before and after loop.
- Percentage of runs with useful run records.
- Human review rejection rate.
- Cost per successful run.
- Time saved compared with manual process.
- Incidents caused by loop output.

For coding loops, also track "tests passed by cheating" as a quality incident,
not a success.

## Relationship To Agent Frameworks

Different platforms name the pieces differently, but the loop shape is stable.

- OpenAI Agents SDK exposes a runner loop that invokes the agent, stops on final
  output, follows handoffs, runs tool calls, and repeats. It also provides
  guardrails and tracing.
- Anthropic describes agents as LLMs using tools based on environmental feedback
  in a loop, with stopping conditions such as maximum iterations.
- Claude Code skills package repeatable procedures, routines schedule saved
  prompts plus repos and connectors, and hooks can verify lifecycle events.
- LangGraph focuses on long-running, stateful agents with persistence,
  human-in-the-loop support, memory, and tracing.
- AWS describes evaluator reflect-refine as a feedback loop where generation and
  evaluation are separate.
- Google Cloud documents a loop agent pattern for iterative workflows and warns
  that bad termination conditions can create infinite loops.

The practical takeaway: do not bind the concept too tightly to one product. A
loop is a design pattern. Products provide different harnesses for running it.

## Practical Design Rules

Use these as defaults:

1. Start with a manual loop before making it scheduled.
2. Start with one agent before adding subagents.
3. Start with one check command before adding multiple gates.
4. Use the smallest working scope.
5. Make "done" machine-checkable whenever possible.
6. Keep destructive actions behind human approval.
7. Store memory outside the chat.
8. Split maker and checker when the loop is high-value or high-risk.
9. Stop on repeated identical failures.
10. Review diffs before merging, even when tests pass.

## Research Map

The reference material falls into four useful groups.

Foundational agent loop research:

- [ReAct](https://arxiv.org/abs/2210.03629): reasoning and acting are
  interleaved so observations can update later steps.
- [Reflexion](https://arxiv.org/abs/2303.11366): failed attempts become verbal
  memory for later trials.
- [Self-Refine](https://arxiv.org/abs/2303.17651): outputs improve through a
  feedback and refine loop.
- [SWE-agent](https://arxiv.org/abs/2405.15793): coding agents benefit from
  agent-computer interface design, not only stronger models.

Production agent guidance:

- [Anthropic, Building effective agents](https://www.anthropic.com/engineering/building-effective-agents)
- [OpenAI, A practical guide to building agents](https://openai.com/business/guides-and-resources/a-practical-guide-to-building-ai-agents/)
- [OpenAI Agents SDK runner](https://openai.github.io/openai-agents-python/ref/run/)
- [AWS evaluator reflect-refine loop](https://docs.aws.amazon.com/prescriptive-guidance/latest/agentic-ai-patterns/workflow-for-evaluators-and-reflect-refine-loops.html)
- [Google Cloud loop agent pattern](https://docs.cloud.google.com/architecture/choose-design-pattern-agentic-ai-system)
- [LangGraph overview](https://docs.langchain.com/oss/python/langgraph/overview)

Coding loop practitioner material:

- [loops!](https://loops.elorm.xyz/)
- [Addy Osmani, Loop Engineering](https://addyosmani.com/blog/loop-engineering/)
- [MindStudio, What Is an Agentic Loop?](https://www.mindstudio.ai/blog/what-is-an-agentic-loop-ai-coding-agents)

Local reference index:

- [Saved reference materials](./references/agentic-loop-reference-materials.md)

## Final Mental Model

Prompt engineering is about the next instruction.

Loop engineering is about the whole operating cycle:

```text
who starts it
what it can touch
what it observes
how it updates memory
who checks it
what it must never do
when it stops
what evidence it leaves behind
```

A loop is good when it lets the agent do more useful work with less human
typing. A loop is bad when it lets the agent make more mistakes before anyone
notices.
