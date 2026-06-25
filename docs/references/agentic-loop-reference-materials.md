# Agentic Loop Reference Materials

Last researched: 2026-06-25

This file saves the reference map behind
[../agentic-loops.md](../agentic-loops.md). It intentionally stores titles,
URLs, and notes rather than full article copies.

## How To Read This

Use the main guide for the practical synthesis. Use this file when you need to
trace a claim back to a source or find a local loop example.

The sources are grouped by purpose:

- Local examples: the repo's concrete loop definitions.
- Core research: papers that explain why repeated reason-act-observe,
  reflection, and refinement work.
- Platform docs: production guidance and framework mechanics.
- Practitioner material: current "loop engineering" discussion and coding-agent
  patterns.

## Local Examples

The repo contains 42 local loop examples under `../../examples/`.

| Category | Local reference |
| --- | --- |
| API | [API Contract Until Match](../../examples/api/api-contract-until-match/loop-definition.md), [OpenAPI Sync Until Valid](../../examples/api/openapi-sync-until-valid/loop-definition.md) |
| Automation | [Guardrails Learning Loop](../../examples/automation/guardrails-learning-loop/loop-definition.md), [Ralph Story Executor](../../examples/automation/ralph-story-executor/loop-definition.md) |
| CI | [CI Failure Watcher](../../examples/ci/ci-failure-watcher/loop-definition.md), [Fix CI Until Green](../../examples/ci/fix-ci-until-green/loop-definition.md), [PR Babysitter](../../examples/ci/pr-babysitter/loop-definition.md), [PR Watch Loop](../../examples/ci/pr-watch-loop/loop-definition.md), [Ship PR Until Green](../../examples/ci/ship-pr-until-green/loop-definition.md) |
| Database | [Migration Until Applied](../../examples/database/migration-until-applied/loop-definition.md) |
| Debugging | [Investigation Script Loop](../../examples/debugging/investigation-script-loop/loop-definition.md), [Reflexion Debug Loop](../../examples/debugging/reflexion-debug-loop/loop-definition.md) |
| DevOps | [Deploy Verification Loop](../../examples/devops/deploy-verification-loop/loop-definition.md), [Staging Smoke Test](../../examples/devops/staging-smoke-test/loop-definition.md) |
| Docs | [Changelog Sync After Ship](../../examples/docs/changelog-sync-after-ship/loop-definition.md) |
| Git | [Merge Conflict Resolver](../../examples/git/merge-conflict-resolver/loop-definition.md) |
| Maintenance | [Dependency Audit Weekly](../../examples/maintenance/dependency-audit-weekly/loop-definition.md), [Dependency Upgrade One-by-One](../../examples/maintenance/dependency-upgrade-one-by-one/loop-definition.md), [Docs Sync After Edits](../../examples/maintenance/docs-sync-after-edits/loop-definition.md), [Knip Until Clean](../../examples/maintenance/knip-until-clean/loop-definition.md), [Security Audit Weekly](../../examples/maintenance/security-audit-weekly/loop-definition.md) |
| Performance | [Bundle Size Budget](../../examples/performance/bundle-size-budget/loop-definition.md) |
| Planning | [Spec-First Ship](../../examples/planning/spec-first-ship/loop-definition.md) |
| Quality | [A11y Audit Until Clean](../../examples/quality/a11y-audit-until-clean/loop-definition.md) |
| Review | [De-Sloppify Pass](../../examples/review/de-sloppify-pass/loop-definition.md), [loop-kit](../../examples/review/loop-kit-mql1vea1/loop-definition.md), [PR Self-Review](../../examples/review/pr-self-review/loop-definition.md) |
| Security | [npm Audit Fix Loop](../../examples/security/npm-audit-fix-loop/loop-definition.md) |
| Testing | [Autoloop TDD](../../examples/testing/autoloop-tdd/loop-definition.md), [Build Until Green](../../examples/testing/build-until-green/loop-definition.md), [cardxc](../../examples/testing/cardxc-mqi8i0wc/loop-definition.md), [Coverage Until Threshold](../../examples/testing/coverage-until-threshold/loop-definition.md), [E2E Until Green](../../examples/testing/e2e-until-green/loop-definition.md), [Flaky Test Triage](../../examples/testing/flaky-test-triage/loop-definition.md), [Format Until Clean](../../examples/testing/format-until-clean/loop-definition.md), [Independent Verifier Pass](../../examples/testing/independent-verifier-pass/loop-definition.md), [Lint and Typecheck Fix](../../examples/testing/lint-typecheck-fix/loop-definition.md), [Post-Edit Test Guard](../../examples/testing/post-edit-test-guard/loop-definition.md), [Post-Merge Regression Guard](../../examples/testing/post-merge-regression-guard/loop-definition.md), [Pre-Commit Guard](../../examples/testing/pre-commit-guard/loop-definition.md), [Test Until Green](../../examples/testing/test-until-green/loop-definition.md), [Visual Regression Until Match](../../examples/testing/visual-regression-until-match/loop-definition.md) |

Local inventory facts used in the main guide:

- Total loops: 42.
- Trigger types: 33 manual, 6 interval, 3 event.
- Exit condition types: 17 `tests_pass`, 6 `lint_clean`, 5 `ci_green`,
  13 `manual`, 1 `max_iterations`.
- Largest category: Testing, with 14 examples.
- Most definitions put injected guardrails in top-level `effectiveGuardrails`.

## Core Research

### ReAct: Synergizing Reasoning And Acting In Language Models

URL: <https://arxiv.org/abs/2210.03629>

Why it matters: ReAct is one of the clearest foundations for agent loops. It
combines reasoning traces with actions, then uses observations from tools or
environments to update later decisions.

Used in the main guide:

- [What Makes This Agentic](../agentic-loops.md#what-makes-this-agentic)
- [Why Loops Work](../agentic-loops.md#why-loops-work)
- [Research Map](../agentic-loops.md#research-map)

### Reflexion: Language Agents With Verbal Reinforcement Learning

URL: <https://arxiv.org/abs/2303.11366>

Why it matters: Reflexion shows a loop where agents write verbal reflections
after task feedback, store those reflections in memory, and use them to improve
later attempts. This maps directly to local loops that append failure notes to a
file.

Used in the main guide:

- [Memory And State](../agentic-loops.md#memory-and-state)
- [Debugging And Learning Loops](../agentic-loops.md#debugging-and-learning-loops)
- [Research Map](../agentic-loops.md#research-map)

### Self-Refine: Iterative Refinement With Self-Feedback

URLs:

- <https://arxiv.org/abs/2303.17651>
- <https://selfrefine.info/>

Why it matters: Self-Refine defines a generate, feedback, refine loop. It is a
clean reference for evaluator-style loops even when there is no external test
suite.

Used in the main guide:

- [Why Loops Work](../agentic-loops.md#why-loops-work)
- [Verification](../agentic-loops.md#verification)
- [Research Map](../agentic-loops.md#research-map)

### SWE-agent: Agent-Computer Interfaces Enable Automated Software Engineering

URL: <https://arxiv.org/abs/2405.15793>

Why it matters: SWE-agent is useful because it shifts attention from "which
model?" to "what interface does the agent use?" The paper shows that the
agent-computer interface affects software-engineering performance.

Used in the main guide:

- [What Great Looks Like](../agentic-loops.md#what-great-looks-like)
- [Relationship To Agent Frameworks](../agentic-loops.md#relationship-to-agent-frameworks)
- [Research Map](../agentic-loops.md#research-map)

### A Self-Improving Coding Agent

URL: <https://arxiv.org/html/2504.15228v1>

Why it matters: This paper explores coding agents that improve their own
implementation. It is a more advanced and higher-risk version of loop design:
the loop does not just improve an artifact, it can improve the agent scaffold.

Used in the main guide:

- [Memory And State](../agentic-loops.md#memory-and-state)
- [When Not To Use A Loop](../agentic-loops.md#when-not-to-use-a-loop)

## Platform And Framework Docs

### Anthropic: Building Effective Agents

URL: <https://www.anthropic.com/engineering/building-effective-agents>

Why it matters: Anthropic gives a practical distinction between workflows and
agents, recommends simple composable patterns, describes evaluator-optimizer
loops, and says agents commonly terminate through completion or stopping
conditions such as max iterations.

Used in the main guide:

- [Why Loops Work](../agentic-loops.md#why-loops-work)
- [Verification](../agentic-loops.md#verification)
- [Relationship To Agent Frameworks](../agentic-loops.md#relationship-to-agent-frameworks)

### Anthropic: Computer Use Tool

URL: <https://platform.claude.com/docs/en/agents-and-tools/tool-use/computer-use-tool>

Why it matters: The doc names the "agent loop" as the program that sends model
actions to an environment and returns screenshots or command outputs. This is a
clean implementation-level definition of the loop harness.

Used in the main guide:

- [The Core Loop Skeleton](../agentic-loops.md#the-core-loop-skeleton)
- [Relationship To Agent Frameworks](../agentic-loops.md#relationship-to-agent-frameworks)

### Claude Code Skills

URL: <https://code.claude.com/docs/en/skills>

Why it matters: Skills are a way to package repeated instructions, checklists,
scripts, and reference files so loops do not re-learn project behavior every
run.

Used in the main guide:

- [Memory And State](../agentic-loops.md#memory-and-state)
- [Relationship To Agent Frameworks](../agentic-loops.md#relationship-to-agent-frameworks)

### Claude Code Routines

URL: <https://code.claude.com/docs/en/routines>

Why it matters: Routines show how loops become scheduled or event-triggered
automation: prompt plus repositories plus connectors plus trigger.

Used in the main guide:

- [Trigger Design](../agentic-loops.md#trigger-design)
- [Relationship To Agent Frameworks](../agentic-loops.md#relationship-to-agent-frameworks)

### Claude Code Hooks

URL: <https://code.claude.com/docs/en/hooks-guide>

Why it matters: Hooks show lifecycle-based verification. Agent hooks can inspect
files and run commands before allowing a stop decision, which maps directly to
loop guard and verification design.

Used in the main guide:

- [Guardrails](../agentic-loops.md#guardrails)
- [Verification](../agentic-loops.md#verification)

### OpenAI: A Practical Guide To Building Agents

URLs:

- <https://openai.com/business/guides-and-resources/a-practical-guide-to-building-ai-agents/>
- <https://cdn.openai.com/business-guides-and-resources/a-practical-guide-to-building-agents.pdf>

Why it matters: The guide covers when to build agents, how to structure
instructions and orchestration, and how to layer guardrails. It is especially
useful for deciding when loops are worth their added complexity.

Used in the main guide:

- [Guardrails](../agentic-loops.md#guardrails)
- [When Not To Use A Loop](../agentic-loops.md#when-not-to-use-a-loop)
- [Measuring Loop Quality](../agentic-loops.md#measuring-loop-quality)

### OpenAI Agents SDK Runner

URL: <https://openai.github.io/openai-agents-python/ref/run/>

Why it matters: The runner docs explicitly define an agent run as a loop:
invoke the agent, stop on final output, follow handoffs, otherwise run tools and
repeat.

Used in the main guide:

- [The Core Loop Skeleton](../agentic-loops.md#the-core-loop-skeleton)
- [Relationship To Agent Frameworks](../agentic-loops.md#relationship-to-agent-frameworks)

### OpenAI Agents SDK Guardrails

URL: <https://openai.github.io/openai-agents-python/guardrails/>

Why it matters: The guardrails docs separate input, output, and tool guardrails.
That distinction matters when designing loop checks, because not every guardrail
runs at every point in a multi-agent workflow.

Used in the main guide:

- [Guardrails](../agentic-loops.md#guardrails)
- [Verification](../agentic-loops.md#verification)

### OpenAI Agents SDK Tracing

URL: <https://openai.github.io/openai-agents-python/tracing/>

Why it matters: Tracing captures model generations, tool calls, handoffs,
guardrails, and custom events. That is the production-grade version of a local
loop run log.

Used in the main guide:

- [Observability](../agentic-loops.md#observability)
- [Measuring Loop Quality](../agentic-loops.md#measuring-loop-quality)

### AWS: Evaluator Reflect-Refine Loop Patterns

URLs:

- <https://docs.aws.amazon.com/prescriptive-guidance/latest/agentic-ai-patterns/evaluator-reflect-refine-loop-patterns.html>
- <https://docs.aws.amazon.com/prescriptive-guidance/latest/agentic-ai-patterns/workflow-for-evaluators-and-reflect-refine-loops.html>

Why it matters: AWS frames evaluator loops as a feedback-control pattern:
generate, evaluate, trigger corrective action, and adapt toward a quality or
goal. It also calls out code generation and review as a use case.

Used in the main guide:

- [Verification](../agentic-loops.md#verification)
- [Pattern Catalog](../agentic-loops.md#pattern-catalog)

### Google Cloud: Choose A Design Pattern For Your Agentic AI System

URL: <https://docs.cloud.google.com/architecture/choose-design-pattern-agentic-ai-system>

Why it matters: Google Cloud documents the loop agent pattern and explicitly
warns that poor termination conditions can lead to infinite loops.

Used in the main guide:

- [Exit Condition Design](../agentic-loops.md#exit-condition-design)
- [When Not To Use A Loop](../agentic-loops.md#when-not-to-use-a-loop)
- [Common Failure Modes](../agentic-loops.md#common-failure-modes)

### Hugging Face Agents Course: Thought-Action-Observation Cycle

URL: <https://huggingface.co/learn/agents-course/en/unit1/agent-steps-and-structure>

Why it matters: This is a concise educational reference for the while-loop
mental model: thought, action, observation, repeat until the objective is
fulfilled.

Used in the main guide:

- [What A Loop Is](../agentic-loops.md#what-a-loop-is)
- [What Makes This Agentic](../agentic-loops.md#what-makes-this-agentic)

### LangGraph Overview

URL: <https://docs.langchain.com/oss/python/langgraph/overview>

Why it matters: LangGraph focuses on durable execution, persistence,
human-in-the-loop support, memory, and observability for long-running stateful
agents.

Used in the main guide:

- [Memory And State](../agentic-loops.md#memory-and-state)
- [Observability](../agentic-loops.md#observability)
- [Relationship To Agent Frameworks](../agentic-loops.md#relationship-to-agent-frameworks)

### LangChain Human-In-The-Loop Middleware

URL: <https://docs.langchain.com/oss/python/langchain/human-in-the-loop>

Why it matters: Human-in-the-loop middleware gives concrete approval, edit,
reject, and respond patterns for risky tool calls. That maps to loop approval
gates.

Used in the main guide:

- [Guardrails](../agentic-loops.md#guardrails)
- [When Not To Use A Loop](../agentic-loops.md#when-not-to-use-a-loop)

## Practitioner And Current Loop Engineering Material

### loops!

URLs:

- <https://loops.elorm.xyz/>
- <https://loops.elorm.xyz/loops/test-until-green>

Why it matters: This is the source style for the local examples. It frames
loops as closed-loop workflows for coding agents with triggers, feedback gates,
and exit conditions.

Used in the main guide:

- [The Local Loop Format](../agentic-loops.md#the-local-loop-format)
- [Full Local Example Catalog](../agentic-loops.md#full-local-example-catalog)

### Addy Osmani: Loop Engineering

URL: <https://addyosmani.com/blog/loop-engineering/>

Why it matters: This is a clear current writeup of "loop engineering" as the
move from manually prompting agents to designing systems that prompt, triage,
check, remember, and delegate. It is especially useful for the five-piece
practitioner model: automations, worktrees, skills, plugins/connectors, and
subagents, plus memory.

Used in the main guide:

- [What Great Looks Like](../agentic-loops.md#what-great-looks-like)
- [Memory And State](../agentic-loops.md#memory-and-state)
- [Practical Design Rules](../agentic-loops.md#practical-design-rules)

### MindStudio: What Is An Agentic Loop?

URL: <https://www.mindstudio.ai/blog/what-is-an-agentic-loop-ai-coding-agents>

Why it matters: This source gives a practical coding-agent explanation:
agentic loops receive a goal, decide next action, execute, observe, and stop or
continue. It also catalogs common mistakes such as vague goals, missing
guardrails, cost surprises, self-assessment, and skipped diff review.

Used in the main guide:

- [What A Loop Is](../agentic-loops.md#what-a-loop-is)
- [How To Design A New Loop](../agentic-loops.md#how-to-design-a-new-loop)
- [Common Failure Modes](../agentic-loops.md#common-failure-modes)

### O'Reilly Radar: Loop Engineering

URL: <https://www.oreilly.com/radar/loop-engineering/>

Why it matters: This republishes the loop engineering discussion for a broader
software audience. It is useful as a signal that the term has moved beyond
single-product docs into general engineering vocabulary.

Used in the main guide:

- [Final Mental Model](../agentic-loops.md#final-mental-model)

### Business Insider: Forget Prompt Engineering, Loop Engineering Is All The Rage Now

URL: <https://www.businessinsider.com/what-are-loops-ai-engineering-tips-2026-6>

Why it matters: This was used only as current context on the term "loop
engineering" and the industry discussion around coding agents. The technical
claims in the main guide are grounded in primary docs and research above.

Used in the main guide:

- Background only.

## Research Artifact Policy

Raw search output was used only as temporary input. The durable reference
material is this Markdown index plus the source links above. This keeps the repo
useful without storing scraped copies of external pages.
