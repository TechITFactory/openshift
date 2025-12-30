# Contributing

Thanks for helping improve the OpenShift End-to-End Platform Operations curriculum! This guide explains how to propose changes and keep the repository consistent.

## Ground Rules

- Follow the [Code of Conduct](CODE_OF_CONDUCT.md) and [Security Policy](SECURITY.md).
- Keep pull requests focused on a single logical change.
- Align all content with the [style guide](docs/style-guide.md) and update the [course map](docs/course-map.md) when scope changes.

## Ways to Contribute

- Improve documentation modules and labs.
- Add diagrams or assets that clarify concepts.
- Enhance automation scripts in `scripts/`.
- Report issues (typos, broken links, gaps, bugs).

## Getting Started

1. Fork the repo and create a branch: `git checkout -b <type>/short-description`.
2. Ensure you have `git`, `oc`, and `npx` (Node.js) available for running checks.
3. Read the relevant module/lab you’re editing to match tone and structure.

## Workflow

1. **Plan:** Confirm the change, affected files, and acceptance criteria.
2. **Edit:** Follow the Standard Module Layout in the style guide.
3. **Validate locally:**
   - `scripts/check-markdown.sh`
   - `scripts/check-links.sh`
4. **Update artifacts:** Refresh [docs/course-map.md](docs/course-map.md) if module coverage changes; add alt text for any new images.
5. **PR:** Provide a clear summary, testing notes, and environment context (CRC/SNO/lab cluster).

## Content Guidelines

- Use relative links and keep line lengths reasonable (≤ 120 characters).
- Name files predictably (`module-01-title.md`, `lab-02-title.md`).
- Place diagrams in `diagrams/` and images in `assets/`.
- Include validation steps and troubleshooting tips in labs.

## Commit Messages

Use short, descriptive messages (examples):

- `docs: add networking module objectives`
- `lab: update storage validation steps`
- `chore: fix broken relative links`

## Review Expectations

- CI must pass (markdown lint + link check).
- Respond to feedback promptly; keep discussions on the PR.
- Maintainers may request revisions for clarity, accuracy, or style alignment.

## Questions or Help

- Open a GitHub Discussion or issue with context and screenshots/logs where relevant.
- For security concerns, follow [SECURITY.md](SECURITY.md) instead of opening a public issue.
