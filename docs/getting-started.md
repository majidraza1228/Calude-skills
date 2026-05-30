# Getting Started

Three types of people use this playbook. Pick yours and follow the steps.

---

## Who are you?

- [I'm a Developer](#developer) — I write code and want AI to help with my daily workflow
- [I'm a PM](#project-manager) — I run sprints, write tickets, and manage delivery
- [I'm a User](#user) — I just want to use the skills, not build or contribute anything

---

## Developer

**Goal:** AI helps you while you code — no copy-pasting prompts, no extra setup per project.

### Step 1 — Clone and install

```bash
git clone https://github.com/majidraza1228/claude-skills.git
cd claude-skills
./scripts/install-skills.sh --global
```

This puts all skills into `~/.claude/skills/` so they work in any project automatically.

### Step 2 — Open Claude Code in your project

```bash
cd your-project
claude
```

### Step 3 — Use skills while you code

| What you're doing | Type this | Skill |
|---|---|---|
| Starting a feature | "plan this feature: user auth with OAuth" | `/planning` |
| Writing code | "review my code" | `/code-review` |
| Hit a bug | "TypeError: cannot read property of undefined" | `/debugging` |
| About to commit | "write a commit message" | `/commit-message` |
| Writing tests | "write tests for this function" | `/tdd` |
| Something is slow | "this query takes 4 seconds" | `/performance` |
| Need docs | "document this class" | `/doc-generator` |
| Security check | "check this for vulnerabilities" | `/security` |

### Step 4 — Get output as a file (optional)

Add "save this to a file" to any request. Claude writes the output to the `output/` folder.

### Tool-specific setup

Not using Claude Code? See the guide for your tool:

- [Claude Code](claude-code-setup.md)
- [VS Code + Copilot](vscode-setup.md)
- [Cursor](cursor-setup.md)
- [OpenAI Codex](codex-setup.md)
- [Windsurf](windsurf-setup.md)
- [Gemini CLI](gemini-cli-setup.md)

---

## Project Manager

**Goal:** Replace manual PM admin (tickets, standups, retros, sprint planning) with skill triggers.

### Step 1 — Install

```bash
git clone https://github.com/majidraza1228/claude-skills.git
cd claude-skills
./scripts/install-skills.sh --global
```

### Step 2 — Use skills for daily PM tasks

| Task | Type this | What you get |
|---|---|---|
| Write a Jira ticket | "write a ticket: users can't reset password when 2FA is on" | Summary, steps to reproduce, acceptance criteria, labels |
| Plan a sprint | "plan the billing feature sprint" | Task list with S/M/L sizing, dependencies, risks |
| Daily standup | "write my standup: finished auth PR, starting billing, blocked on design spec" | Done / doing / blockers — no filler |
| Sprint retro | "retro: sprint 12, missed velocity, auth incident on day 3" | What went well / delta / actions table with owners |
| Team summary | "/team-digest" | Sprint velocity, blocker table, who is stuck and how long |
| Write a PRD | "write a PRD for CSV export" | Problem, goals, non-goals, requirements, open questions |

### Step 3 — Set up the agent PM system (optional)

No PM check-ins needed. Developers run `/daily-checkin` once a day. You run `/team-digest` to see everything.

```bash
# Copy templates to your project root
cp templates/TEAM.md ./TEAM.md
cp templates/SPRINT.md ./SPRINT.md

# Install the agent PM skills
./scripts/install-skills.sh --project daily-checkin team-digest
```

Fill `SPRINT.md` with your tasks and owners. Each dev runs `/daily-checkin` in 30 seconds. You get a full team summary on demand.

### Tool-specific setup

- [Claude Code](claude-code-setup.md)
- [VS Code + Copilot](vscode-setup.md)
- [Cursor](cursor-setup.md)
- [OpenAI Codex](codex-setup.md)
- [Windsurf](windsurf-setup.md)
- [Gemini CLI](gemini-cli-setup.md)

---

## User

**Goal:** Get value from the skills — no contributing, no building, just using.

### Step 1 — Browse the skills

Go to the [Skills Browser](https://majidraza1228.github.io/claude-skills/skills.html). Browse by category. Click any skill to see what it does, what phrases trigger it, and an example input/output.

Pick 3–5 skills that match your daily pain points. Don't install everything at once.

### Step 2 — Install for your tool

Pick your tool and follow the guide:

| Tool | Setup guide | Install command |
|---|---|---|
| **Claude Code** | [claude-code-setup.md](claude-code-setup.md) | `./scripts/install-skills.sh --global` |
| **VS Code + Copilot** | [vscode-setup.md](vscode-setup.md) | `./scripts/export-skills.sh copilot` |
| **Cursor** | [cursor-setup.md](cursor-setup.md) | `./scripts/export-skills.sh cursor` |
| **OpenAI Codex** | [codex-setup.md](codex-setup.md) | `./scripts/export-skills.sh codex` |
| **Windsurf** | [windsurf-setup.md](windsurf-setup.md) | `./scripts/export-skills.sh windsurf` |
| **Gemini CLI** | [gemini-cli-setup.md](gemini-cli-setup.md) | `./scripts/export-skills.sh gemini` |

### Step 3 — Trigger with natural language

You don't memorize commands. Just describe what you need:

```
"review my code"                          → code review with severity table
"I want to become an FDE at Palantir"     → 3-phase FDE career roadmap
"write a ticket for this bug"             → Jira-ready ticket
"plan this feature"                       → sprint task list with sizing
"write my standup"                        → done / doing / blockers
```

### Step 4 — Get output as a file (optional)

Add "save this to a file" at the end of any request. Claude writes it to the `output/` folder.

```
"write a ticket for this bug — save to a file"
"give me the FDE career roadmap and save it"
```

---

## Which tool should I use?

| If you want | Best tool |
|---|---|
| Skills that auto-route with zero effort | Claude Code |
| Skills inside your existing VS Code setup | VS Code + Copilot |
| Skills inside Cursor's AI workflow | Cursor |
| Skills in task-based AI agent runs | Codex |
| Skills always available in Windsurf | Windsurf |
| CLI-first workflow with slash commands | Gemini CLI |

All tools use the same skill files. The difference is only how you install and invoke them.
