# Performance Review Drafter

Guide a complete performance review with evidence gathered from Slack, Notion, GitHub, and Linear. Works for self-assessments and upward assessments. Output is plain text ready to paste into your HR system.

## Step 1 — Collect Setup Info

Ask the user for:
1. Review period (e.g. H1 2026)
2. Assessment type: self, upward, or both
3. Subject's name and Slack user ID (for upward: the manager; for self: the user themselves)
4. The competency list with observables — ask the user to paste directly from Namely
5. Confirm the Namely rating scale: 1=Under Performer, 2=Needs Development, 3=Meets Expectations, 4=Rockstar, 5=Unicorn

Then create a draft file: `./performance_review_[period]_[subject]_draft.md`

Ask the user whether they want to work through all sections in one pass or one at a time.

---

## Step 2 — Evidence Gathering

For each competency, search for evidence BEFORE drafting. Use all available MCP tools in parallel.

### Slack (primary source)

For upward assessment:
- `from:<@MANAGER_SLACK_ID> after:PERIOD_START` in public/private channels and DMs
- Include `channel_types: public_channel,private_channel,mpim,im`
- Run 2-3 searches per competency with different keyword angles (see patterns below)

For self-assessment:
- Search for messages from the user, PRs they opened, and messages referencing their work

**Keyword patterns by competency type:**
- Communication: 1:1, agenda, takeaway, recognition, kudos, feedback, update
- Customer Centricity: customer, shipper, client, production, failure, fix, proactive
- Data Focus: accuracy, metrics, quality, test, standard, governance, definition
- Product Execution: sync, decision, blocker, priority, migration, milestone, unblock
- Stakeholder Management: align, expectation, coordinate, engineering, ops, finance
- Team Leadership: shoutout, trust, accountability, onboarding, pushing, direction

### Notion
- Search for 1:1 notes between the user and subject
- Search for strategy docs, roadmaps, or OKR docs they authored during the period
- Fetch the full doc if found — the honest current-state assessments and planning details are often the richest evidence

### Linear
- Search issues assigned to or created by the subject during the review period
- Look for completed cycles, project ownership, and ticket volume as evidence of planning and execution
- Useful for self-assessment: ticket descriptions, linked PRs, and status updates show sequencing decisions and delivery cadence
- For upward assessment: look at projects the manager created, milestones set, and how they structured work for the team
- Ask the user for the relevant team or project identifier before searching

### GitHub
- Search commits and PRs by the subject during the review period
- Look for PR reviews, comments, and code quality signals
- Note: GitHub usernames often don't match Slack names — confirm with the user before searching

---

## Step 3 — Overall Impact

Draft this section first — it sets the frame for everything else.

Write 3-5 plain sentences (no bullets) covering:
- Headline deliverables with quantified outcomes where possible
- Business or financial impact
- Scope and cross-functional reach

Lead with the most concrete result. Avoid adjectives without evidence ("significant," "impactful") — let the numbers speak.

---

## Step 4 — Competency Drafting

Work one competency at a time. Draft, show to user, get approval, write to file. Repeat.

**If evidence is thin for a competency:** say so explicitly rather than drafting from memory. Tell the user what searches returned and suggest they paste relevant Slack messages or Notion excerpts directly. Never fill a bullet with a claim you cannot trace to a specific search result.

**Content rules:**
1. 3 bullets per section, each covering a different observable from the competency definition
2. Every bullet must cite a specific datable incident — channel, approximate date, and what happened
3. Keep a running list of incidents used across sections. Do not reuse the same story in two sections. A strong review uses 15+ distinct incidents across 7 competencies.
4. For upward assessment: never attribute the assessee's own work or initiative to the manager. If unclear who initiated something, ask the user before including it.
5. Quote discipline: only use verbatim quotes found in search results. If you can't find the exact message, describe the behavior without quoting. Note the channel type (DM vs public) so the user knows what's easily verifiable.

**Format (plain text — no markdown):**
```
COMPETENCY: [Name] | Rating: [N] - [Label]

- [Bullet 1]
- [Bullet 2]
- [Bullet 3]
```

---

## Step 5 — Validation Checklist

Before presenting each section to the user, verify:
- Each bullet names a specific incident (not a generic pattern claim)
- No incident appears in more than one section
- For upward: no bullet claims the assessee's own contributions belong to the subject
- All direct quotes were found verbatim in actual search results
- Output is plain text only (no bold, no headers, no markdown syntax)

---

## Step 6 — File Output

Write each approved section to the draft file immediately after user confirms. Do not batch writes.

When all sections are done, remind the user:
- Copy each section from the draft file into Namely individually
- Namely does not render formatting — paste as plain text
- Double-check rating selections in the UI (they're separate from the text fields)

---

## Common Pitfalls

- **Attribution errors** — the most common mistake in upward assessments. When in doubt, ask who initiated it.
- **Recycled examples** — track what you've used. Each section should tell a different story.
- **Generic bullets** — "always communicates clearly" fails the specificity test. "Published structured meeting takeaways to #data_team after every weekly sync (May 2026)" passes.
- **Unverified quotes** — if a quote came from a DM the user can't easily find, flag it. If you can't locate the source message, describe rather than quote.
- **Channel blindness** — note which channel each piece of evidence comes from. If the user wasn't in the channel, they can't verify the story from their end.
