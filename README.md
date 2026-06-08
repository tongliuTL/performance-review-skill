# Performance Review Skill for Claude Code

A Claude Code custom command that guides a complete Namely performance review cycle — self-assessment or upward assessment — with evidence gathered from Slack, Notion, and GitHub.

Every bullet ends up grounded in a specific, datable, verifiable incident rather than generic claims. Works for any Namely-style competency framework.

## What It Does

- Searches Slack, Notion, and GitHub for real evidence per competency
- Drafts 3 bullets per section, each covering a different observable
- Tracks evidence across sections to prevent the same story appearing twice
- Guards against common mistakes: attribution errors, unverified quotes, generic claims
- Outputs plain text ready to paste into Namely (no markdown)

## Install

Copy the skill file to your Claude Code global commands directory:

```bash
cp commands/performance-review.md ~/.claude/commands/performance-review.md
```

Or symlink it so updates to the repo flow through automatically:

```bash
ln -s "$(pwd)/commands/performance-review.md" ~/.claude/commands/performance-review.md
```

Verify it's available by opening Claude Code and typing `/performance-review`.

## Usage

In any Claude Code session:

```
/performance-review
```

Claude will ask for:
1. Review period (e.g. H1 2026)
2. Assessment type: self, upward, or both
3. Subject's Slack user ID
4. Competency list pasted from Namely

Then it searches for evidence and drafts each section for your review before writing anything to file.

## Requirements

The following MCP integrations need to be connected in Claude Code for evidence gathering to work:

- **Slack** — searches messages by sender, date, and keyword
- **Notion** — fetches 1:1 notes and strategy documents
- **GitHub** — searches commits and PRs (optional but useful for self-assessments)

## How It Works

The skill is a single markdown file that Claude Code loads as a system prompt when invoked. It encodes:

- **Evidence-first discipline** — gather evidence per competency before drafting
- **Keyword patterns** — tailored search angles per competency type (communication, data focus, etc.)
- **Cross-section deduplication** — tracks incidents used so each section tells a different story
- **Attribution guard** — in upward assessments, flags risk of accidentally crediting the assessee's own work to their manager
- **Quote verification** — only uses verbatim quotes found in actual search results, and flags DM-sourced quotes the reviewer can't easily verify
- **Plain text output** — Namely doesn't render markdown; the skill enforces plain text throughout

## Customising

The skill is designed to be adapted. Common customisations:

- **Different rating scale** — edit the scale labels in the skill file if your company uses different terminology
- **Different HR system** — remove the Namely-specific output format notes and replace with your system's requirements
- **Additional evidence sources** — add Linear, Jira, or other MCP tools to the evidence gathering section
- **Company-specific competencies** — the skill asks the user to paste their competency list at the start of each session, so no customisation needed for this

## Lessons From the Field

This skill was built after manually completing an H1 2026 review cycle at Nuvocargo. The main failure modes it guards against:

1. **Attribution errors** — crediting the IC's own work to the manager in upward assessments
2. **Recycled examples** — using the same incident in Product Execution, Stakeholder Management, and Team Leadership
3. **Unverified quotes** — paraphrasing a message as a direct quote when the original wasn't checked
4. **Generic bullets** — "always communicates clearly" vs. "published structured meeting takeaways to #data_team after every weekly sync (May 2026)"
5. **Channel blindness** — using evidence from a channel the reviewer wasn't in and can't verify

## Contributing

PRs welcome. Especially useful additions:
- Support for other HR systems (Lattice, Workday, Culture Amp)
- Additional MCP evidence sources
- Example outputs showing what strong vs. weak bullets look like
