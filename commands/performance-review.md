# Performance Review Drafter

Guide a complete performance review with evidence gathered from Slack, Notion, GitHub, and Linear. Works for self-assessments and upward assessments. Output is plain text ready to paste into your HR system.

---

## Step 1 — Setup

### 1a. Verify MCP connections

Confirm each integration is usable by making a lightweight test call (e.g. search Slack for a single recent message, list a Notion page). Do not just check whether the tool name appears in your list — an integration can be listed but unauthenticated. If a call fails, stop and tell the user:

> "The [X] integration is not connected or authenticated. To fix it: open claude.ai → click your profile → Integrations → reconnect [X]. Then start a new Claude Code session and run /performance-review again."

Required:
- **Slack** — primary evidence source for all assessment types
- **Notion** — 1:1 notes and strategy docs
- **Linear** — ticket and project evidence
- **GitHub** — optional, most useful for self-assessments

### 1b. Collect identifiers

Gather everything needed before any searching starts. Ask for all of these upfront so the session runs without interruption.

**Identifiers** (Slack user IDs: click a user's profile → ··· → Copy member ID):
- Review period (e.g. H1 2026) — sets date filters on all searches
- Assessment type: self, upward, or both
- Subject's Slack user ID — for upward: the manager; for self: the user's own ID
- Subject's GitHub username — note: often differs from Slack display name
- Subject's display name in Linear — often differs from Slack
- Linear team name or URL (e.g. `linear.app/your-org/team/DATA`)

**Notion docs** (page ID is the UUID at the end of the page URL):
- Link or ID of the 1:1 meeting notes doc with the subject
- Any strategy, roadmap, or OKR docs relevant to the period — paste links if available

**Rubric:**
- Full competency list with observables — ask the user to paste directly from their HR system
- Rating scale labels — confirm or ask the user to paste (e.g. 1=Under Performer → 5=Unicorn)

Then create a draft file: `./performance_review_[period]_[subject]_draft.md`

Ask the user whether they want to work section by section (more control) or all evidence gathered first then draft in one pass (faster).

---

## Step 2 — Evidence Gathering

Gather evidence for **all competencies across all sources in one parallel batch** before drafting anything. Do not interleave evidence gathering with drafting — front-loading this gives complete data for every section and avoids mid-draft interruptions.

Fan out searches across every competency × every source simultaneously.

### Slack (primary source)

For upward assessment: `from:<@SUBJECT_SLACK_ID> after:PERIOD_START` across `public_channel,private_channel,mpim,im`

For self-assessment: search for the user's own messages and messages referencing their work

Run 2-3 searches per competency using different keyword angles:
- Communication: 1:1, agenda, takeaway, recognition, kudos, feedback, update
- Customer Centricity: customer, shipper, client, production, failure, fix, proactive
- Data Focus: accuracy, metrics, quality, test, standard, governance, definition
- Product Execution: sync, decision, blocker, priority, migration, milestone, unblock
- Stakeholder Management: align, expectation, coordinate, engineering, ops, finance
- Team Leadership: shoutout, trust, accountability, onboarding, direction

### Notion
- Fetch the 1:1 notes doc using the ID from Step 1
- Search for strategy docs, roadmaps, or OKR docs authored during the period
- Fetch full docs when found — planning details and honest current-state assessments are often the richest evidence

### Linear
- Search issues assigned to or created by the subject during the period
- Look for completed cycles, project ownership, and milestone structure
- For self-assessment: ticket descriptions, linked PRs, and status updates show sequencing and delivery decisions
- For upward assessment: projects the manager created, milestones set, and how they structured work for the team
- Use the team identifier and subject display name collected in Step 1

### GitHub
- Search commits and PRs by the subject during the period using the GitHub username from Step 1
- Look for PR reviews, comments, and code quality signals

---

## Step 3 — Competency Drafting

Work one competency at a time. Draft → show to user → get approval → write to file. Repeat.

**If evidence is thin for a competency**, do not draft from memory. Work through this sequence first:
1. Try alternate keyword angles (see Step 2 patterns)
2. Widen the date range slightly beyond the review period
3. Check an adjacent source (e.g. if Slack is thin, try Notion or Linear)
4. Ask the user to paste specific messages or links they remember

Only after exhausting these should you tell the user evidence is sparse for this section.

**Attribution discipline (upward assessments):**
Never attribute the assessee's own work or initiative to the manager. Be especially suspicious when:
- The evidence mentions both people in the same message
- The assessee is described as "supporting," "helping," or "enabling" rather than owning
- The source is a manager's own status update about something the IC built

When in doubt, ask the user who initiated it before drafting.

**Source discipline:**
Only use claims you can trace to a specific search result. For direct quotes: use verbatim text only. For paraphrases: the summary must not shift meaning, sentiment, or scope beyond what the source supports — if you cannot write a paraphrase you are confident is accurate, quote directly or describe the behavior without quoting. Note the channel type (DM vs. public) so the user knows what is easily verifiable.

**Cross-section uniqueness:**
Keep a running list of incidents used. Do not reuse the same story in two sections. A strong review uses 15+ distinct incidents across 7 competencies.

**Content per bullet:**
- 3 bullets per section, each covering a different observable from the competency definition
- Every bullet names a specific datable incident — channel, approximate date, what happened

**Format (plain text — no markdown):**
```
COMPETENCY: [Name] | Rating: [N] - [Label]

- [Bullet 1]
- [Bullet 2]
- [Bullet 3]
```

---

## Step 4 — Overall Impact

Draft this section **last**, after all competencies are complete — it summarises the full picture and is most accurate when written from the finished drafts.

Write 3-5 plain sentences (no bullets) covering:
- Headline deliverables with quantified outcomes where possible
- Business or financial impact
- Scope and cross-functional reach

Lead with the most concrete result. Avoid adjectives without evidence ("significant," "impactful") — let the numbers carry it.

---

## Step 5 — Validation

Before presenting each section, verify:
- Each bullet names a specific incident, not a generic pattern claim
- No incident appears in more than one section
- For upward: no bullet attributes the assessee's own contributions to the subject
- All claims are traceable to a specific search result
- Output is plain text only (no bold, headers, or markdown syntax)

---

## Step 6 — File Output

Write each approved section to the draft file immediately after user confirms. Do not batch writes.

When all sections are done, remind the user:
- Copy each section from the draft file into their HR system individually
- Most HR systems do not render markdown — paste as plain text
- Double-check rating selections in the UI (they are separate from the text fields)

---

## Common Pitfalls

- **Attribution errors** — the most common mistake in upward assessments. When in doubt, ask who initiated it.
- **Recycled examples** — track what you have used. Each section should tell a different story.
- **Generic bullets** — "always communicates clearly" fails. "Published structured meeting takeaways to #data_team after every weekly sync (May 2026)" passes.
- **Paraphrase drift** — subtly shifting meaning, scope, or sentiment when summarising what someone said or did. If you cannot write an accurate paraphrase, quote directly or describe the behavior instead.
- **Channel blindness** — note which channel evidence comes from. If the user was not in the channel, they cannot verify the story from their end.
