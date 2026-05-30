---
name: forward-deployed-engineering
description: >
  Skill for forward deployed engineers (FDEs) — engineers who work directly with enterprise
  customers to deploy, customise, and scale software on-site. Covers the FDE career path
  (how to get in, what companies hire, interview prep) and day-to-day FDE practice (technical
  discovery, rapid deployment, stakeholder communication, knowledge transfer). Triggers on
  'forward deployed engineer', 'FDE role', 'customer-facing engineering', 'on-site deployment',
  'technical discovery', 'enterprise deployment', 'how do I become an FDE', or
  'working with enterprise customers'.
version: "1.0"
updated: "2026-05-30"
---

# Forward Deployed Engineering

Two modes. Detect which the user needs — or ask.

**Mode A — Career path:** How to get into FDE roles and what to build toward.
**Mode B — FDE practice:** Frameworks for doing the work once you're in the role.

---

## Mode A — FDE Career Path

### What the role actually is

A forward deployed engineer (FDE) is placed at a customer site — or works deeply with one enterprise customer at a time — to deploy, customise, and integrate software that generic sales engineers can't handle alone. You are part engineer, part consultant, part product manager.

The role is common at:
- **AI/defence tech:** Palantir (the originator), Anduril, Scale AI, Shield AI
- **AI infrastructure:** Databricks, Snowflake, Weights & Biases
- **Developer tools:** GitHub, HashiCorp, Harness.io
- **Enterprise AI:** Anthropic, Cohere, Glean

What makes it different from a solutions engineer or sales engineer:
- You write real production code at the customer site
- You own the deployment end-to-end, not just the demo
- You feed product requirements back to the engineering team
- Customer success is measured in months, not a 90-minute POC

### Skills that matter most

| Skill | Why it matters |
|-------|---------------|
| Full-stack coding | You deploy and debug in customer environments with no support |
| Systems thinking | You map an enterprise's existing stack and find where to plug in |
| Fast prototyping | You build a working demo in 48 hours, not 2 weeks |
| Stakeholder communication | You translate between a CTO and a front-line analyst in the same meeting |
| Documentation | Every custom integration needs a handoff doc the customer can maintain |
| Security awareness | Enterprise environments have strict controls; you work within them |

### Career roadmap to FDE

**Phase 1 — Build the engineering foundation (months 1-9)**

You need to be a credible engineer first. Harness.io, Palantir, and Scale AI all reject FDE candidates who can't code their way out of a real problem.

- Get comfortable in at least 2 languages (Python + one of: TypeScript, Go, Java)
- Build 2-3 full-stack projects you can demo end-to-end
- Get real with APIs, auth, databases, and deployment (Docker, basic k8s)
- Resources:
  - 📺 YouTube: **Fireship** — rapid exposure to tools and patterns
  - 📺 YouTube: **TechWorld with Nana** — k8s, Docker, CI/CD from scratch
  - 🔨 Project: Build an internal tool for a real team (not a toy app). Ship it.

**Phase 2 — Build the customer-facing layer (months 6-12)**

FDE interviews test your ability to think in a customer context, not just code.

- Practice technical discovery: interview a real user about their workflow and map it to a system diagram
- Write one integration doc (API integration, data pipeline, or deployment guide) as if a stranger needs to maintain it
- Do a mock POC: pick a real enterprise tool and build a minimal integration
- Read: *The Trusted Advisor* (Maister et al.) — the best book on technical client relationships
- Follow on X/LinkedIn: Palantir FDE blog posts, Scale AI engineering blog

**Phase 3 — Target and apply (months 9-18)**

- Target companies: Palantir, Anduril, Scale AI, Harness.io, Databricks (all hire FDEs or equivalent roles titled "deployment engineer", "solutions engineer", "field engineer")
- Palantir specifically: apply to the "Forward Deployed Software Engineer" programme. Expect a take-home deployment challenge
- Harness.io: look for "Customer Engineer" or "Solutions Engineer" roles — the day-to-day involves live customer environments and Harness pipeline debugging
- Tailor your CV: lead with customer impact ("shipped X for [customer type], reduced their Y by Z") not internal projects

### Interview prep

FDE interviews typically have 3 components:

1. **Coding round** — standard LeetCode medium, sometimes a systems design question. Practice both.
2. **Customer simulation** — they put you in a mock customer conversation. You'll be given a scenario: the customer is unhappy, the integration is broken, the scope has changed. Stay calm, ask clarifying questions, don't promise things you can't deliver.
3. **Deployment challenge** — take-home or live: given a spec and a codebase, deploy something and document it. Speed and clarity of your docs matter as much as the code.

---

## Mode B — FDE Day-to-Day Practice

### Technical discovery framework

Before touching any code, map the customer's environment. Use this 5-question framework:

1. **What exists?** Current stack, tools in use, data sources, auth systems
2. **What breaks?** Their most painful manual process or integration gap
3. **What's blocked?** Security policies, procurement constraints, data residency rules
4. **Who decides?** The technical champion (your day-to-day contact) vs. the economic buyer (who signs off)
5. **What does success look like?** Specific, measurable — not "easier to use"

Deliver a 1-page discovery summary after every first meeting. It forces clarity and shows the customer you understood them.

```markdown
## Discovery Summary — [Customer] — [Date]

**Their stack:** [key tools]
**The pain:** [specific broken thing]
**Constraints:** [security, compliance, data rules]
**Success criteria:** [measurable outcome]
**Next step:** [one concrete action with owner and date]
```

### Rapid deployment workflow

FDEs ship in days, not sprints. This is the rhythm:

**Day 1:** Discovery + environment access. Get credentials, understand the network topology, identify the integration points.
**Day 2-3:** Minimal working integration. Doesn't need to be pretty — it needs to prove the concept works in their actual environment.
**Day 4:** Demo to the technical champion. Get sign-off before expanding scope.
**Day 5:** Document what you built, handoff notes, known limitations.

Never scope-creep before day 4. Customers will ask for more — write it down for phase 2, don't add it now.

### Stakeholder communication

You will be in rooms with both a CTO and a front-line analyst. The skill is switching registers in real time:

| Audience | What they care about | How to communicate |
|----------|--------------------|--------------------|
| CTO / VP Eng | Risk, cost, timeline | Business outcomes, not implementation details |
| Technical champion | Does it actually work? | Show, don't tell. Live demo > slide |
| Front-line users | Will this break my workflow? | Walk them through it. Be patient. |
| Procurement / security | Compliance, data handling | Written answers, never verbal assurances |

**One rule:** Never say "that's easy" in a customer meeting. Instead: "let me check that and come back to you by [time]."

### Documentation and handoff

Every FDE engagement ends with a handoff doc. Write it as if you've just been hit by a bus and someone else needs to maintain this system.

Required sections:
1. **What was built** — system diagram + 2-paragraph description
2. **How to run it** — step-by-step, no assumed knowledge
3. **How to debug it** — the 3 most likely failure modes and how to fix them
4. **How to extend it** — where to add the next feature
5. **Who to call** — your contact at the vendor + escalation path

Keep it in the customer's own repo or wiki, not yours.

### Common failure modes

| Failure | What it looks like | Fix |
|---------|-------------------|-----|
| Scope creep | Day 3 and you're still in discovery | Hard-commit to a day 4 demo date on day 1 |
| Shadow IT | Your champion isn't the decision-maker | Map the org chart before you start building |
| Environment hell | Works locally, broken on their infra | Get environment access on day 1, test immediately |
| Undocumented handoff | Customer can't maintain it after you leave | Write docs as you build, not after |
| Over-promising | "We can do X" before checking feasibility | Always say "let me confirm" in the room |

---

## Output format

**For Mode A (career path):** Deliver a phased roadmap with specific resources, a timeline, and interview prep for the companies the user is targeting.

**For Mode B (FDE practice):** Deliver the specific framework, template, or checklist for the task at hand (discovery summary, deployment plan, handoff doc, stakeholder prep).
