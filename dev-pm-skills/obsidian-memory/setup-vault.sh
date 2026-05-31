#!/bin/bash
# Creates the Agent Memory folder structure inside your Obsidian vault

VAULT="${1:-$HOME/Documents/ObsidianVault}"
MEMORY="$VAULT/Agent Memory"

mkdir -p "$MEMORY/User"
mkdir -p "$MEMORY/Projects"
mkdir -p "$MEMORY/Decisions"
mkdir -p "$MEMORY/Patterns"
mkdir -p "$MEMORY/Feedback"
mkdir -p "$MEMORY/Daily"

TODAY=$(date +%Y-%m-%d)

cat > "$MEMORY/INDEX.md" << 'EOF'
# Agent Memory Index

## User
- [profile](User/profile.md) — add your role and preferences here

## Projects

## Decisions

## Patterns

## Feedback

## Daily
EOF

cat > "$MEMORY/User/profile.md" << EOF
---
tags: [memory, user]
date: $TODAY
related: [[INDEX]]
confidence: high
---

# User Profile

## Summary
Update this with who you are and how you work.

## Detail
- **Role:** (e.g., AI/agent builder, PM, full-stack developer)
- **Stack:** (e.g., Python, FastAPI, Claude API)
- **Working style:** (e.g., prefers concise answers, no trailing summaries)

## Do not
- (anything Claude should never do for you)
EOF

cat > "$MEMORY/Daily/$TODAY.md" << EOF
---
tags: [memory, daily]
date: $TODAY
related: [[INDEX]]
confidence: high
---

# $TODAY

## Summary
First session — vault initialised.

## Detail
Agent Memory vault created. Obsidian memory skill installed.
EOF

echo "✓ Vault structure created at: $MEMORY"
echo "  Open in Obsidian, then install the skill:"
echo "  cp -r dev-pm-skills/obsidian-memory ~/.claude/skills/"
