# loops

Reusable agentic loop definitions and reference material.

An agentic loop is a repeatable control system around an AI agent:

```text
goal -> context -> agent action -> real observation -> check -> memory update -> repeat or stop
```

This repo collects practical loop examples for coding agents and documents how
to design, run, verify, and improve them.

## What Is Here

- `docs/agentic-loops.md` - the main guide to agentic loop design.
- `docs/references/agentic-loop-reference-materials.md` - source notes behind
  the guide.
- `examples/` - 42 local loop examples across testing, CI, review, maintenance,
  debugging, API work, devops, security, and planning.
- `skills/loop-authoring/` - a local skill for creating, refining, and auditing
  loop definitions.

Each example usually includes:

- `loop-definition.md` - a human-readable loop description.
- `loop-definition.json` - a structured loop definition with steps, guardrails,
  trigger metadata, and an exit condition.
- Optional install bundles, such as `.cursor/loops/...`, when the loop has
  agent-specific setup files.

## How To Use A Loop

1. Pick the loop closest to the job under `examples/`.
2. Read its `loop-definition.md`.
3. Replace placeholder commands, paths, branches, endpoints, and test names.
4. Make sure the exit condition is measurable and safe.
5. Run the loop in the target agent and keep the final evidence.

Start with the goal and the check. The loop is only useful if it knows what
success means and cannot fake that success by weakening the check.

## Start Here

- Read [Agentic Loops](docs/agentic-loops.md).
- Browse [examples/testing/test-until-green](examples/testing/test-until-green/)
  for a simple coding-agent loop.
- Browse [examples/ci/pr-babysitter](examples/ci/pr-babysitter/) for a watch
  loop that wakes up on a schedule.

## Install The Local Skill

To install the included loop-authoring skill into local Codex and Claude Code
skill directories:

```bash
make install
```

Codex loads it from `~/.agents/skills/loop-authoring/`.
Claude Code loads it from `~/.claude/skills/loop-authoring/`.
