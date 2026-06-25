# Codex And Claude Code Setup

Use this reference when a loop or the loop-authoring skill must work cleanly in
Codex and Claude Code.

## Installed skill paths

For installable skills:

- Codex reads shared skills from `~/.agents/skills/<skill-name>/`.
- Claude Code reads skills from `~/.claude/skills/<skill-name>/`.
- Codex invocation style is `$skill-name`.
- Claude Code invocation style is `/skill-name`.

Do not install new hooks unless the user explicitly asks for hook behavior. A
prompt-first skill should not need runtime hooks.

## Skill package shape

The lean package shape is:

```text
skills/<skill-name>/
  SKILL.md
  references/
  agents/openai.yaml
```

Use `SKILL.md` for the trigger contract, workflow, non-negotiables, and output
expectations.

Use `references/` for deeper doctrine, templates, examples, and validation
criteria.

Use `agents/openai.yaml` only when UI metadata or invocation policy adds value.

Add `scripts/` only when deterministic validation, transforms, or repeated code
are genuinely needed.

## Codex and Claude loop compatibility

When generating loop definitions, use honest compatibility fields:

```json
"compatibleAgents": ["codex", "claude-code", "cursor", "any"],
"bestForAgents": ["codex", "claude-code"]
```

Only include an agent when the loop can actually run there. A loop that depends
on a Claude-only slash command, a Codex-only tool, or a Cursor-only install
bundle should say so.

## Portable kickoff prompts

Prefer natural-language kickoff prompts over runtime-only command syntax:

```text
Start the "Test Until Green" loop.

Goal: all tests pass
Max iterations: 10
Between iterations run: npm test
Exit when: npm test exits 0

Step 1: Run tests. If there are failures, fix the smallest root cause, then
repeat.

Self-pace this loop. After each iteration, run the check command, read the
output, and only continue if the exit condition is not met. Stop when the exit
condition passes or max iterations is reached. Give a short status update each
pass.

Guardrails:
- Do not modify the check command or exit criteria to force success.
- Do not skip, disable, or bypass checks to pass the exit condition.
- If stuck after several iterations, stop and report blockers instead of gaming
  metrics.
```

If a loop should be invoked through a skill, give both forms:

```text
Codex: use $loop-authoring to refine this loop.
Claude Code: use /loop-authoring to refine this loop.
```

Keep those notes out of the core loop when they are not needed to run it.

## Repository install Makefile

For a small repo that ships one or a few skills, this install shape is enough:

```makefile
SKILLS := loop-authoring
AGENTS_SKILLS_DIR ?= $(HOME)/.agents/skills
CLAUDE_SKILLS_DIR ?= $(HOME)/.claude/skills

install: install_skill claude_install_skill

install_skill:
	mkdir -p $(AGENTS_SKILLS_DIR)
	for skill in $(SKILLS); do \
		rm -rf $(AGENTS_SKILLS_DIR)/$$skill; \
		cp -R skills/$$skill $(AGENTS_SKILLS_DIR)/$$skill; \
	done

claude_install_skill:
	mkdir -p $(CLAUDE_SKILLS_DIR)
	for skill in $(SKILLS); do \
		rm -rf $(CLAUDE_SKILLS_DIR)/$$skill; \
		cp -R skills/$$skill $(CLAUDE_SKILLS_DIR)/$$skill; \
	done
```

Add pruning and verification when the repo has references, generated files, or
multiple install targets.

## Verification

Verify installability separately from loop quality:

- `SKILL.md` exists in both install roots after `make install`.
- Frontmatter has `name` and `description`.
- Description is no more than 1024 characters unless the runtime says otherwise.
- `agents/openai.yaml` matches the skill name and behavior.
- No broken local Markdown links.
- No generated `build/`, `prompts/`, `__pycache__`, or `*.pyc` internals are
  installed.

Then verify loop execution quality separately:

- the loop can start from the kickoff prompt
- the first observation source exists
- the exit condition is checkable
- the loop has a hard stop
- the loop reports success or blocker with evidence
