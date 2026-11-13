# Changelog

All notable changes to qlock are documented in this file.

## 0.10.2

### Changes

- Install the shared changelog library from GitHub (10a9fc3)

  Pin @codethread/cli-changelog to a full GitHub commit and record its integrity in bun.lock. Standard frozen-lockfile installs fetch the shared package for source, CI and Homebrew builds. Compiled executables bundle the dependency.

  - **Adoption (optional):** Run bun install --frozen-lockfile and rebuild the executable to use the GitHub-pinned dependency.

## 0.10.1

### Changes

- Use the shared CLI changelog library (ca5bed8)

  Load changelog schemas, version queries, pagination and rendering from the local @codethread/cli-changelog package. The compiled executable bundles the library.

  - **Adoption (required):** For source builds, install dependencies in the cli-changelog checkout and run bun link there before installing this repository with bun install --frozen-lockfile. Compiled executables need no additional files.

## 0.10.0

No recorded changes.

## 0.9.1

### Changes

- Run qlock independently of Hive (142a07a)

  Build and install qlock from its own repository. Merge queues use Git directly and no longer require Honeycomb. Queue behavior, SQLite storage and existing lock paths are unchanged.

  - **Adoption (optional):** Install with Homebrew or build from source. Read README.md for installation commands; no project setup is required.

## 0.9.0

No recorded changes.

## 0.8.1

No recorded changes.

## 0.8.0

No recorded changes.

## 0.7.1

No recorded changes.

## 0.7.0

No recorded changes.

## 0.6.3

No recorded changes.

## 0.6.2

No recorded changes.

## 0.6.1

### Changes

- show queue tool release changes without joining a queue (e35554e)

  Run `qlock changelog` for bundled release history and adoption instructions.
  Version selection and paginated JSON output work without acquiring a lock.

## 0.6.0

### Changes

- Help explains queue admission timeouts and how to resume a retained ticket. (7887340)
