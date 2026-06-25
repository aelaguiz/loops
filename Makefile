SKILLS := loop-authoring
AGENTS_SKILLS_DIR ?= $(HOME)/.agents/skills
CLAUDE_SKILLS_DIR ?= $(HOME)/.claude/skills

.PHONY: install install_skill claude_install_skill

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

