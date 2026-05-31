---
name: obsidian-memory
description: >
  Use this skill when the user says "remember this", "add to my vault",
  "what do you know about", "check your notes", "recall", "update memory",
  "what have we decided about", or "make me smarter about". Also use whenever
  completing a task that produced a decision, pattern, or preference worth
  keeping — proactively write to the vault after significant work without
  being asked. The goal: the agent gets smarter with every session because
  knowledge persists across conversations.
version: "1.0"
updated: "2026-05-31"
---

# Obsidian Memory Skill

You are an agent with persistent memory stored in an Obsidian vault. Obsidian stores notes as plain markdown files — you read and write them directly using your file tools. No plugin required.

## Vault Location

Default path: `~/Documents/ObsidianVault/Agent Memory/`

If the user tells you a different path, use that path for the rest of the session and note it in the session context.

---

## Two Modes

### Mode A — Recall (triggered by "what do you know about", "check notes", "recall")

1. Read `INDEX.md` first — it lists every memory file and a one-line summary
2. Open the 1–3 most relevant files based on the topic
3. Surface what you already know **before** doing any new work
4. Tell the user: "From your vault I know: [X]. Proceeding with that context."

### Mode B — Write (triggered by "remember this", "add to vault", or after any significant task)

1. Identify what type of memory this is (see types below)
2. Write the note to the correct folder using the note template
3. Update `INDEX.md` with a one-line entry for the new note
4. Link the new note to related notes using `[[wikilinks]]`

---

## Vault Structure

```
~/Documents/ObsidianVault/Agent Memory/
├── INDEX.md                        ← master index, always update this
├── User/
│   └── profile.md                  ← who the user is, role, expertise, preferences
├── Projects/
│   └── <project-slug>.md           ← per-project knowledge and active state
├── Decisions/
│   └── YYYY-MM-DD-<slug>.md        ← why a choice was made (the WHY, not the WHAT)
├── Patterns/
│   └── <pattern-name>.md           ← recurring approaches that worked or failed
├── Feedback/
│   └── <topic>.md                  ← corrections and confirmed preferences
└── Daily/
    └── YYYY-MM-DD.md               ← episodic log — what happened in this session
```

---

## Note Template

Every note you write must use this exact structure:

```markdown
---
tags: [memory, <folder-tag>, project/<project>]
date: YYYY-MM-DD
related: [[INDEX]], [[other-note]]
confidence: high | medium | low
---

# <Title>

## Summary
One sentence — what this note is about.

## Detail
The actual content. For decisions: what was chosen and WHY.
For patterns: what worked, what didn't, and in what context.
For feedback: what the correction was and the reasoning behind it.

## Do not
Any constraint or anti-pattern to avoid (optional but valuable).

## Related
- [[linked-note-1]]
- [[linked-note-2]]
```

---

## INDEX.md Format

Keep `INDEX.md` under 100 lines. One line per memory file:

```markdown
# Agent Memory Index

## User
- [profile](User/profile.md) — developer, Python/Flask, AI agent builder

## Projects
- [claude-skills](Projects/claude-skills.md) — playbook site, GitHub Pages, skills repo

## Decisions
- [2026-05-31-auth-choice](Decisions/2026-05-31-auth-choice.md) — bcrypt over MD5, flagged in security audit

## Patterns
- [obsidian-as-memory](Patterns/obsidian-as-memory.md) — vault as agent memory backend

## Feedback
- [testing-preferences](Feedback/testing-preferences.md) — real DB only, no mocks

## Daily
- [2026-05-31](Daily/2026-05-31.md) — built obsidian-memory skill, deployed to prod
```

---

## Memory Rules

| Rule | Why |
|------|-----|
| **Store WHY, not WHAT** | The code shows what exists. The vault explains the reasoning. |
| **One note per decision** | Not one note per project. Granular notes are easier to prune. |
| **Use `[[wikilinks]]`** | Builds a knowledge graph — Claude surfaces connections automatically. |
| **Confidence tag** | Marks uncertain memories so you don't act on stale guesses. |
| **Prune before trusting** | Ask: "Is this still true?" before using a note older than 30 days. |
| **Don't duplicate git** | `git log` owns history. The vault owns reasoning and preferences. |
| **Update INDEX every write** | A memory file that isn't in INDEX is invisible to future recall. |

---

## The Memory Loop

```
Session starts
    ↓
Read INDEX.md + relevant notes (Mode A)
    ↓
Complete the task with full context
    ↓
Write what was learned (Mode B)
    ↓
Update INDEX.md
    ↓
Link new note to related notes via [[wikilinks]]
    ↓
Session ends — knowledge persists for next session
```

---

## What to Write After a Task (proactive memory)

After any session where you:
- Made an architectural decision → write a `Decisions/` note
- Noticed a user preference or working style → update `User/profile.md`
- Found a pattern that worked or failed → write a `Patterns/` note
- Were corrected on approach → update `Feedback/` note
- Completed significant work → append to `Daily/YYYY-MM-DD.md`

Always ask: *"Would a future me in a new session benefit from knowing this?"* If yes, write it.

---

## With Obsidian MCP (optional enhancement)

If the user has the Obsidian MCP plugin installed, use MCP tools instead of direct file reads:

```json
// .claude/mcp.json
{
  "mcpServers": {
    "obsidian": {
      "command": "npx",
      "args": ["-y", "mcp-obsidian", "/path/to/vault"]
    }
  }
}
```

MCP gives you semantic search across the vault (`obsidian_search`) rather than reading files one at a time. Use `obsidian_search` first, then open specific notes with `obsidian_read_note`.

---

## Output Format

### When recalling (Mode A)
```
## From your vault

**Known context:**
- [what you found and which note it came from]
- [any related patterns or decisions]

**Confidence:** high / medium / low
**Note age:** X days — [still current / recommend verifying]

Proceeding with this context…
```

### When writing (Mode B)
```
## Memory saved

**File:** Agent Memory/Decisions/2026-05-31-auth-choice.md
**Summary:** bcrypt chosen over MD5 — security audit requirement
**Linked to:** [[User/profile]], [[Projects/claude-skills]]
**INDEX.md:** updated ✓
```
