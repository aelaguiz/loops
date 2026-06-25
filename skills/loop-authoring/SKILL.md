---
name: loop-authoring
description: "Create, refine, or audit agentic loop definitions and kickoff prompts for Codex, Claude Code, Cursor, or similar coding agents. Use when the user wants to build a new loop, adapt a local loop-definition.md/json, take iterative feedback on a loop, or make loop guardrails, triggers, exit conditions, memory, and verification stronger. Not for running the loop itself, generic prompt repair, broad goal execution, or writing unrelated skills."
metadata:
  short-description: "Create and refine agentic loops"
---

# Loop Authoring

Use this skill when the work is designing or repairing the loop artifact, not
running the loop.

A loop is a bounded agent workflow that repeats action, observation, checking,
memory update, and stop/escalation until an exit condition is met. The skill's
job is to help the user turn a real repeated task into a loop that an agent can
run safely, or to refine an existing loop from feedback without making it rigid.

## Install

```bash
git clone <this-repo>
cd loops
make install
```

Codex reads the installed skill from `~/.agents/skills/loop-authoring/`.
Claude Code reads it from `~/.claude/skills/loop-authoring/`.

In Codex, invoke this skill as `$loop-authoring`. In Claude Code, invoke it as
`/loop-authoring`.

## When to use

- The user wants to create a new `loop-definition.md`, `loop-definition.json`,
  kickoff prompt, or loop package.
- The user wants to refine an existing loop after trying it or giving feedback.
- A loop has weak triggers, fuzzy done-ness, missing guardrails, no memory, no
  escalation path, or checks that can be gamed.
- The user wants a loop made portable across Codex, Claude Code, Cursor, or
  other coding agents.
- The user wants a findings-first audit of a loop before trusting it.
- The user asks for "loop engineering", "agentic loop", "test until green",
  "PR babysitter", "reflexion loop", "guardrails loop", or similar loop work.

## When not to use

- The user wants to run an existing loop to complete the underlying job. Use the
  loop's own kickoff prompt or the matching execution skill.
- The user wants a general reusable skill package. Use `$skill-authoring`.
- The user wants a generic prompt, goal prompt, reviewer prompt, or prompt
  repair with no loop artifact. Use `$prompt-authoring`.
- The user has a broad open-ended goal but no loop artifact request. Use the
  relevant goal or planning skill.
- A deterministic script or CI pipeline can solve the task without agent
  judgment.

## Non-negotiables

- Start from the repeated user problem, the improved world state, 2-3 concrete
  loop use cases, and one nearby anti-case.
- Keep the loop prompt-first and flexible by default. Do not add runners,
  launchers, controllers, formal parameters, or scripts unless the user asks for
  orchestration or prompt guidance has clearly failed.
- Define done-ness before mechanics. A loop without a real exit condition is an
  agent with permission to wander.
- Prefer one primary feedback signal before adding more checks.
- Keep guardrails close to the behavior they protect, especially anti-gaming
  rules for tests, lint, schemas, snapshots, CI config, and exit criteria.
- Treat user feedback as a refinement signal, not as a mandate to append every
  sentence into the loop. Extract the durable principle and patch the owning
  section.
- For existing loops, inspect the current `loop-definition.md`, JSON, kickoff
  prompt, guardrails, examples, and install bundle before editing.
- For Codex and Claude Code, make the final loop runnable with normal natural
  language. Mention runtime-specific invocation only where it changes behavior.
- Ask only when the missing answer would materially change the loop or create
  risk. Otherwise draft a v0 with named assumptions and invite feedback.
- Stop and report blockers when the loop cannot observe progress, cannot define
  a safe stop condition, or would need approval for destructive/high-risk work.

## First move

1. Classify the job as `create`, `refine`, `audit`, or `package`.
2. Read `references/loop-contract.md`.
3. Read `references/interactive-refinement.md`.
4. Read `references/codex-claude-setup.md` when the output must be installable,
   portable, or explicitly compatible with Codex and Claude Code.
5. Read `references/examples-and-anti-patterns.md` only when the right shape or
   failure mode is still fuzzy.
6. If the repo has local loop docs or examples, read the relevant current files
   before changing anything. Treat local files as source truth for that repo,
   but keep the shipped skill self-contained.

## Workflow

### 1. Frame the loop

- Name the repeated task.
- State the improved world state.
- Identify the actor, target repo/system, allowed write scope, and risk level.
- Choose whether the right artifact is a loop, a one-shot prompt, a repo note,
  an ordinary script, or a full skill package.

### 2. Design or inspect the control cycle

For a new loop, draft the smallest useful control cycle:

```text
trigger -> context -> action -> observation -> check -> memory update -> repeat or stop
```

For an existing loop, inspect the current cycle and find the weakest link before
rewriting prose.

### 3. Define the hard parts

Work in this order:

1. Goal and success state.
2. Trigger.
3. Observation source.
4. Primary check or verifier.
5. Max iterations, timeout, or budget.
6. Guardrails and approval gates.
7. Memory/run-log behavior.
8. Escalation and stop reasons.
9. Codex/Claude/Cursor compatibility.
10. Kickoff prompt and generated files.

### 4. Draft the artifact

When editing a repo, create or patch the loop files directly. When answering in
chat, return the smallest useful artifact:

- `loop-definition.md` for human-readable use.
- `loop-definition.json` when a machine-readable definition is needed.
- A portable kickoff prompt when the user only needs the loop text.
- A findings-first audit when the user asks for review or the loop is unsafe.

### 5. Refine from feedback

- Restate the feedback as the design pressure it creates.
- Patch the owning section instead of smearing changes across the whole loop.
- Preserve accepted decisions unless the new feedback contradicts them.
- If feedback points to a new use case, test whether it belongs in this loop or
  deserves a separate loop.
- After each revision, name what changed, what stayed flexible, and what still
  needs a real run to validate.

### 6. Validate before shipping

- Check that the exit condition is observable.
- Check that max iterations or another hard stop exists.
- Check that the agent cannot pass by weakening the check.
- Check that high-risk actions have approval gates.
- Check that generated JSON parses when JSON is part of the output.
- Check that Markdown links resolve when files are created.
- Check that Codex and Claude Code invocation notes are accurate.

## Output expectations

- `create`: produce the loop artifact and a concise design note naming the
  feedback signal, stop condition, guardrails, and runtime compatibility.
- `refine`: patch the existing loop or return exact edits. Explain the design
  pressure from the feedback and the smallest change that addresses it.
- `audit`: return findings first. For each finding, name the loop section, why
  it matters, and the smallest credible fix.
- `package`: create the requested installable file structure and include install
  and verification commands.
- Keep final replies short. Point to changed files and verification evidence.

## Reference map

- `references/loop-contract.md` - loop components, local definition shape,
  quality bar, and validation questions
- `references/interactive-refinement.md` - feedback-taking workflow, anti-
  heuristic refinement, and mode behavior
- `references/codex-claude-setup.md` - Codex and Claude Code compatibility,
  invocation notes, install paths, and portable kickoff prompts
- `references/examples-and-anti-patterns.md` - compact examples and failure
  patterns that teach loop judgment
