# Qlock repository

- Keep qlock behavior and release history in this repository; `changelog.json` is the source of truth for generated `CHANGELOG.md`.
- For setup, review and trust the root `mise.toml`, then run `mise run` (or `mise run bootstrap`) to install the pinned Bun workspace, generate the changelog, and build.
- Run full verification through `qlock exec --lock /tmp/agent-cpu.lock -w 180 -- bun run check`; focused tests can run directly.
- Lake dependencies belong to `.botlake/package.json`; use the root workspace and lockfile rather than a nested install.
