# research — joeycastillo.us/research

## Intent

This project is where we research how external tech can integrate with
Pantheon and kastilsystems — or be replaced.

The four questions, asked of every candidate technology:

1. **Integrate** — wire it in as-is. What changes if we adopt it whole?
2. **Replace** — find or build an alternative. What does our version look like?
3. **Reverse-engineer** — use it as a source for ideas, architecture,
   internals. Take what works, build clean.
4. **Dovetail** — connect it to Pantheon / kastil-systems. Where does it
   join the spine? What contract does it speak?

The meta-question over all four: **roll our own?** Build ourselves or
bring outside. The answer is per-candidate, per-domain.

## Stack

- Static HTML / CSS. No frameworks. Lives at `joeycastillo.us/research`.
- Each research entry is a single HTML file in `entries/`.
- Each entry follows the same template (see `entries/_template.html` once
  the first entry lands).
- Linked from `joeycastillo.us` top nav.

## Conventions

- **One file per candidate.** Filename: `entries/YYYY-MM-DD-<slug>.html`.
- **Four verdicts per entry.** Integrate / Replace / Reverse-engineer /
  Dovetail. Each verdict has a one-line summary + a reasoning paragraph.
- **One overall recommendation** per entry. "Roll our own" or "Adopt with
  these changes" or "Skip and watch."
- **Date-stamped, never silently rewritten.** If a verdict changes, add a
  new dated section to the same entry — don't overwrite the original
  reasoning.
- **No vendor lock-in language.** Don't write "we'll use Auth0 forever" —
  write "Auth0 covers X today; here's what changing looks like."

## Index

The landing page (`index.html`) lists all entries newest-first with a
one-line summary and the verdict.
