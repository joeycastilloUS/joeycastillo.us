# Story Ingestion Convention

How stories get from Joey's head into the archive.

## The Flow

1. **Tell it.** Joey tells a story in any conversation -- any time, any context.
   Spoken, typed, stream of consciousness. No format required.

2. **Extract it.** The AI extracts the triple and metadata:
   - `{what, why I'm proud, era}`
   - category, date, people, domain, tags, featured flag

3. **Confirm it.** AI reads it back:
   > Got it -- {what happened, why it matters, era}. Featured?

   Joey says yes/no. That's it.

4. **File it.** Story saved as `stories/<date>-<slug>.json`.
   Use `~` prefix for approximate dates (e.g., `~2015-tequila-defect.json`).

5. **Index it.** Rebuild `stories/index.json` (all stories inline for single fetch).

6. **Ship it.** Commit + push. Page rebuilds on next deploy.

## Triple Format

```json
{
  "triple": {
    "what": "What happened or was achieved",
    "proud": "Why this matters -- the pride, the significance",
    "era": "Named era of life"
  },
  "category": "lesson|story|growth|sport",
  "date": "YYYY, ~YYYY, YYYY-MM-DD, or null",
  "people": ["Name"],
  "domain": "code|leadership|life|business|hardware|athletics|people",
  "tags": ["tag1", "tag2"],
  "featured": true
}
```

## Categories

| Category | What it captures |
|----------|-----------------|
| lesson | Wisdom earned through pain or insight |
| story | Full narratives -- the scene, the context |
| growth | Level-ups -- before/after transformations |
| sport | Seasons, records, stats, athletic moments |

## Featured vs Timeline

- `featured: true` -- shows on the curated identity page (front page)
- `featured: false` -- timeline only, full archive

Joey decides at ingestion time. Can be changed later.

## Eras

Eras are named chapters of life. They emerge as stories accumulate.
Current known eras:

- **early** -- childhood, first code
- **high-school** -- athletics, early development
- **javelin** -- Javelin era, mentors, formative professional years
- **enterprise** -- POS platforms, hospitality, billion-hour systems
- **metal** -- now. Platform for mankind. Build the chip.

New eras can be created at any time. The system adapts.

## Rules

1. Never generate fake stories. Every entry is real.
2. Joey's voice, Joey's words. Distill, don't rewrite.
3. One story per file. Named by date + slug.
4. Always rebuild index.json after adding stories.
5. The archive only grows. Stories are not deleted.
