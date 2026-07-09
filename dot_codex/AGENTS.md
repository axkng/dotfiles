# Mindset & Process

- Write idiomatic, simple, maintainable code.
- For non-trivial changes, understand the architecture before editing.
- Review the existing codebase and fit changes into the patterns already in use.
- Use official docs or specs when working with APIs, dependencies, security-sensitive code, or unclear behavior.
- Fix root causes instead of applying bandaids. Use the systematic-debugging skill when diagnosing bugs.
- If you delete or move code, do not leave a comment in the old place.
- Remove unused code directly related to the change.
- Search before pivoting. If you are stuck or uncertain, do a quick search of official docs or specs before changing direction.

## Final Handoff

Before finishing a task:

1. Confirm all touched tests or commands were run and passed.
1. Summarize changes with file and line references.
1. Call out any TODOs, follow-up work, or uncertainties.

# Implementation Standards

## Test Driven Development

- For every new feature or bugfix, follow TDD. See the test-driven-development skill for the full workflow.
- Tests should cover changed behavior, important edge cases, and regressions.
- Do not reduce test coverage to make a task pass.
- Do not delete a failing test. Fix related failures and raise unrelated failures with the user.
- Do not write tests that only assert mocked behavior instead of real logic.
- Do not mock end-to-end tests. Use real data and real APIs.
- Read test and system output carefully. Logs and diagnostics are part of the result.
- Test output should be clean. If an error is expected, capture and assert it.

## Dependencies & External APIs

- Before adding a dependency, verify that it is maintained, widely used, appropriately licensed, and a good API fit.
- Prefer established project dependencies and standard-library tools over new packages.

## Version Control

- Check the worktree before editing. If you are on the main branch, create a feature branch first before continuing.
- Ask the user before touching unrelated uncommitted changes or untracked files.
- Track non-trivial work in git when the project is a git repo. YOU MUST commit frequently throughout the development process.
- Never skip, evade, or disable a pre-commit hook.
- Do not use `git add -A` unless you have just reviewed `git status`.
- Never use `git push`.

## Logging

- Prefer one structured wide event per request per service hop.
- Build the event throughout the request lifecycle and emit it once at the end.
- Log what happened to the request, not a step-by-step debugging diary.
- Include enough context to debug success and failure paths: request identity, trace identity, route, status, timing, service metadata, user/session context when allowed, and sanitized error details.
- Staging may log verbosely, including browser console details.
- Production logs must be optional where practical and must not leak personal data, secrets, tokens, or sensitive business data.

# Language-Specific Rules

## Python

- Use `uv` and `pyproject.toml` for Python projects.
- Prefer `uv sync` for environment and dependency resolution.
- Use strong types and type hints. Prefer explicit models over loose dictionaries or stringly typed data.
- Use `ruff` for linting and formatting.
- Do not use pip, pipx, or poetry.

# Cloudflare

- Use Cloudflare Workers. Do not use Cloudflare Pages.
- `wrangler` is installed locally; run it directly.
- Staging deployments are allowed.
- Production deployments are prohibited.

# Bash Commands

- Prefer `rg` for text search and `fd` for file search when available.
- Run `npx tsc` with `--noEmit` and `--skipLibCheck` unless instructed otherwise.
- Prefer `agent-browser` for browser-based webapp testing.

# Jurisdiction

When working on user-facing applications intended to earn money, account for German and EU jurisdiction, including GDPR and the EU AI Act. Pay particular attention to customer rights, privacy, analytics, tracking, and user data handling.
