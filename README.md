# Official pgday CLI for Homebrew

Publisher-maintained Homebrew tap for [pgday.app](https://www.pgday.app), the sales gamification platform operated by Kuckein Consulting. This is a custom tap, separate from Homebrew/core.

## Install

On macOS or Linux with [Homebrew](https://brew.sh):

```sh
brew install kkuckein/pgday/pgday
pgday --version
pgday events list --sandbox
pgday leads list --sandbox --limit 1
pgday spec --sandbox
```

Homebrew supplies Node.js 24. The CLI has no npm runtime dependencies, telemetry or credential storage. The free read-only sandbox uses fictional data and needs no account or key.

Production commands require a scoped `PGDAY_API_KEY` environment variable. Keep credentials in your secret manager; never put them into arguments, URLs, source code or chat. Sandbox commands never send a configured production key. Production entitlement and pilot access restrictions apply.

Read the [developer guide](https://www.pgday.app/developers), [API key guide](https://www.pgday.app/help/api-access?lang=en), or `pgday --help` for commands and permissions. The CLI prints JSON, uses exit codes 0 (success), 1 (API/transport failure) and 2 (usage/credential setup), and never automatically retries writes.

## Releases and maintenance

[Versioned releases](https://github.com/kkuckein/homebrew-pgday/releases) contain the standalone CLI archive and SHA-256 checksum. The formula pins the archive checksum. Published release assets are immutable; fixes require a new version. npm registry publication is not currently available.

This repository contains only distribution files. The CLI retains its existing proprietary `UNLICENSED` designation; publishing this tap does not change that designation. The formula uses `license :cannot_represent` for this reason.

```sh
brew upgrade kkuckein/pgday/pgday
brew test kkuckein/pgday/pgday
```

CI verifies real public installation on macOS and Linux, the executable and package versions, credential-setup errors and anonymous sandbox commands. No production credentials are used.
