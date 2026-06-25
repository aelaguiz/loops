.PHONY: install install_skill claude_install_skill verify_install verify_agents_install verify_claude_install

SKILLS := loop-authoring
AGENTS_SKILLS_DIR ?= $(HOME)/.agents/skills
CLAUDE_SKILLS_DIR ?= $(HOME)/.claude/skills

install: install_skill claude_install_skill

install_skill:
	mkdir -p $(AGENTS_SKILLS_DIR)
	@for skill in $(SKILLS); do \
		rm -rf $(AGENTS_SKILLS_DIR)/$$skill; \
		cp -R skills/$$skill $(AGENTS_SKILLS_DIR)/$$skill; \
	done
	@for skill in $(SKILLS); do \
		find $(AGENTS_SKILLS_DIR)/$$skill \( -name build -o -name prompts -o -name __pycache__ \) -type d -prune -exec rm -rf {} +; \
		find $(AGENTS_SKILLS_DIR)/$$skill -name '*.pyc' -delete; \
	done

claude_install_skill:
	mkdir -p $(CLAUDE_SKILLS_DIR)
	@for skill in $(SKILLS); do \
		rm -rf $(CLAUDE_SKILLS_DIR)/$$skill; \
		cp -R skills/$$skill $(CLAUDE_SKILLS_DIR)/$$skill; \
	done
	@for skill in $(SKILLS); do \
		find $(CLAUDE_SKILLS_DIR)/$$skill \( -name build -o -name prompts -o -name __pycache__ \) -type d -prune -exec rm -rf {} +; \
		find $(CLAUDE_SKILLS_DIR)/$$skill -name '*.pyc' -delete; \
	done

verify_install: verify_agents_install verify_claude_install
	@echo "OK: loop-authoring installed for Codex/agents and Claude Code"

verify_agents_install:
	@for skill in $(SKILLS); do \
		test -f $(AGENTS_SKILLS_DIR)/$$skill/SKILL.md; \
		test -f $(AGENTS_SKILLS_DIR)/$$skill/agents/openai.yaml; \
	done
	@for skill in $(SKILLS); do \
		if find $(AGENTS_SKILLS_DIR)/$$skill \( -name build -o -name prompts -o -name __pycache__ \) -type d -print -quit | grep -q .; then echo "ERROR: source/build internals installed under $(AGENTS_SKILLS_DIR)/$$skill"; exit 1; fi; \
		if find $(AGENTS_SKILLS_DIR)/$$skill -name '*.pyc' -print -quit | grep -q .; then echo "ERROR: Python bytecode installed under $(AGENTS_SKILLS_DIR)/$$skill"; exit 1; fi; \
	done
	@echo "OK: agents skills installed"

verify_claude_install:
	@for skill in $(SKILLS); do \
		test -f $(CLAUDE_SKILLS_DIR)/$$skill/SKILL.md; \
		test -f $(CLAUDE_SKILLS_DIR)/$$skill/agents/openai.yaml; \
	done
	@for skill in $(SKILLS); do \
		if find $(CLAUDE_SKILLS_DIR)/$$skill \( -name build -o -name prompts -o -name __pycache__ \) -type d -print -quit | grep -q .; then echo "ERROR: source/build internals installed under $(CLAUDE_SKILLS_DIR)/$$skill"; exit 1; fi; \
		if find $(CLAUDE_SKILLS_DIR)/$$skill -name '*.pyc' -print -quit | grep -q .; then echo "ERROR: Python bytecode installed under $(CLAUDE_SKILLS_DIR)/$$skill"; exit 1; fi; \
	done
	@echo "OK: Claude Code skills installed"
