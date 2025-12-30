# Documentation Style Guide

Consistent formatting keeps this course readable and easy to maintain. Follow these rules for all Markdown content, labs, and appendices.

## Writing Principles

- **Audience-first:** Explain *why* before *how*; assume practitioners with Kubernetes familiarity.
- **Be concise:** Prefer short sentences and bullet lists. Target line length ≤ 120 characters.
- **Command clarity:** Use fenced code blocks with language hints (`bash`, `yaml`, `json`) and include expected outputs when helpful.
- **Terminology:** Use official OpenShift terms; avoid vendor-ambiguous jargon.
- **Accessibility:** Provide alt text for images; describe what the reader should see.

## Markdown Conventions

- ATX headings (`#`, `##`, `###`); leave one blank line before/after headings.
- Use `-` for lists; keep ordered steps as `1.` for easier reordering.
- Inline code for commands/flags (`oc get nodes`); code fences for multi-line examples.
- Links: prefer relative links within the repo.
- Tables are acceptable; keep them simple and scannable.
- Diagrams and images live in `assets/` and reference from nearby docs with relative paths.
- Optional: generate TOCs with `scripts/generate-toc.sh`.

## Standard Module Layout

Every module page must contain these sections (in order):

1. **Overview:** What the learner will cover and why it matters.
2. **Learning Objectives:** 3–5 measurable outcomes using action verbs.
3. **Prerequisites:** Concepts, required tools, or prior modules.
4. **Content:** Explanatory material with examples and diagrams as needed.
5. **Hands-On Lab:** Step-by-step exercise; include estimated time and environment requirements.
6. **Validation:** How to confirm success (commands, screenshots, or checks).
7. **Troubleshooting:** Common issues and fixes.
8. **Additional Resources:** Links to official docs or deeper dives.

Labs in `labs/` should mirror this structure and add cleanup steps.

## File Naming & Structure

- Module and lab files: `module-NN-title.md` or `lab-NN-title.md` with two-digit numbering.
- Keep supporting files (manifests, scripts) alongside the module or lab they support.
- Place shared diagrams in `diagrams/`; screenshots and images in `assets/`.
- Use `.gitkeep` only when a directory has no tracked files yet.

## Style and Tone

- Use present tense and active voice.
- Prefer imperative instructions for steps (“Run”, “Verify”, “Apply”).
- Highlight cautions or notes with blockquotes:
  - `> **Note:** ...`
  - `> **Caution:** ...`

## Review Checklist

Before opening a PR:

- [ ] Content follows the Standard Module Layout.
- [ ] Commands were validated in the stated environment(s).
- [ ] Links are relative and working (`scripts/check-links.sh`).
- [ ] Markdown passes linting (`scripts/check-markdown.sh`).
- [ ] Images include alt text and live in `assets/`.
- [ ] Updates are reflected in [docs/course-map.md](./course-map.md) when module scope changes.

## Tooling

- **Markdown lint:** `scripts/check-markdown.sh` (uses `markdownlint-cli` via `npx`).
- **Link check:** `scripts/check-links.sh` (uses `markdown-link-check` via `npx`).
- **TOC (optional):** `scripts/generate-toc.sh` (uses `markdown-toc` via `npx`).

Keep scripts executable (`chmod +x scripts/*.sh`) and run them from the repository root.
