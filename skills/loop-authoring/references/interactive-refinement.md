# Interactive Refinement

Use this reference when the loop changes across user feedback, failed trials, or
review findings.

## Core rule

Refinement is not accumulation.

Do not paste every feedback sentence into the loop. Convert feedback into the
design pressure it creates, then patch the section that owns that pressure.

Examples:

- "It kept touching unrelated files" usually belongs in scope and guardrails.
- "It said done even though CI was still running" belongs in exit condition and
  verification.
- "It asked me too many questions" belongs in first move and assumption policy.
- "It got stuck retrying the same thing" belongs in memory and repeated-failure
  stop behavior.
- "It only works for npm" may belong in examples, not the core contract.

## Mode behavior

### Create

Start from the repeated problem, not the artifact shape.

1. Identify the repeated task and improved world state.
2. Pick 2-3 representative use cases.
3. Name one anti-case that should not use this loop.
4. Draft the smallest loop that can observe progress.
5. Ask for feedback only on choices that materially change safety or utility.

### Refine

Patch an existing loop without resetting accepted decisions.

1. Read the existing loop files first.
2. State the current weakest link.
3. Map each piece of user feedback to the owning section.
4. Apply the smallest coherent change.
5. Explain what changed and why.
6. Leave a short next-run validation note.

### Audit

Use findings first.

For each finding:

- name the affected loop section
- show the concrete weakness
- explain why it matters
- give the smallest credible fix

Do not rewrite the whole loop unless the findings show the control cycle is
wrong.

### Package

Package only the artifacts the target runtime needs. Do not invent a runner
when a kickoff prompt and loop definition are enough.

## Question discipline

Ask when:

- the exit condition could be one of several materially different checks
- the loop might touch production, credentials, money, users, or irreversible
  state
- the agent's write scope is unclear and broad writes would be risky
- the user asked for scheduled or event-triggered behavior but the trigger
  source is unknown

Do not ask when:

- the repo has obvious local conventions to inspect
- a reasonable v0 can be drafted safely
- the missing detail can be represented as a placeholder
- the question only helps make the loop prettier

When questions are useful, ask at most three and keep them tied to decisions.
For ordinary ambiguity, draft with assumptions and label them.

## Feedback patch map

| Feedback signal | Likely owning section |
| --- | --- |
| "It ran too long" | hard stop, max iterations, timeout, budget |
| "It stopped too early" | exit condition, verifier, completion evidence |
| "It broke unrelated code" | scope, allowed files, guardrails, review |
| "It cheated the check" | anti-gaming guardrails, protected check command |
| "It forgot prior attempts" | memory, run log, reflection |
| "It spammed comments" | action limits, schedule trigger, escalation |
| "It missed risky actions" | approval gates, high-risk stop rules |
| "It is too specific" | examples, placeholders, portability notes |
| "It is too vague" | goal, observation source, primary check |
| "It is too much ceremony" | remove extra checks, scripts, fields, or modes |

This table is a diagnostic aid, not a rule engine. If the evidence points
elsewhere, follow the evidence.

## Anti-overbuild rules

- Keep one loop focused on one workflow family.
- Prefer one check command before adding multiple gates.
- Prefer prompt guidance before scripts.
- Prefer examples over hardcoded decision tables.
- Prefer "read the local project's test command" over naming one package
  manager in the core contract.
- Keep runtime-specific branches small and explicit.
- Split a loop only when the use cases have different triggers, different
  verifiers, or different risk profiles.

## Refinement completion

A refinement pass is done when:

- the feedback has been mapped to a design pressure
- the owning section has been patched
- the loop still has observable done-ness and a hard stop
- no new guardrail contradicts the loop's intended autonomy
- the next run has a clear validation signal

If the feedback reveals that the loop cannot observe progress, stop and say
that the loop design is not yet viable.
