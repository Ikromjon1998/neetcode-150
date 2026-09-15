# 00 — Getting started

## What you need

| Tool | Version | Check |
|------|---------|-------|
| Python | 3.11+ | `python3 --version` |
| Node | 20+ | `node --version` |
| PHP | 8.2+ with `mbstring` | `php --version && php -m \| grep mbstring` |
| Composer | 2.x | `composer --version` |
| GNU Make | any | `make --version` |

On macOS: `brew install python node php composer`. On Ubuntu:
`sudo apt install python3-venv nodejs npm php-cli php-mbstring composer`.

## Install

```bash
make setup
```

That does three things:

- **Python** — creates `.venv`, installs `packages/core-python` and `apps/api-python` in
  editable mode, so an edit to an algorithm is live immediately.
- **Node** — `npm install` across the workspaces (`packages/core-ts`, `apps/api-node`), then
  builds the core library to `dist/` because the NestJS app imports the built package.
- **PHP** — `composer install` in both `packages/core-php` and `apps/api-php`. The app
  consumes the core package through a Composer *path* repository symlinked into `vendor/`, so
  again, edits are live.

Expect two to four minutes on a cold machine, almost all of it Composer and npm.

## Verify

```bash
make status
```

```
problem                              python       ts      php   reference
--------------------------------------------------------------------------
   1. two-sum                          todo     todo     todo   yes
  36. valid-sudoku                     todo     todo     todo   yes
  ...
0 / 27 implementations written (9 problems x 3 languages)
```

Now run the tests:

```bash
make test
```

**They fail.** All of them. That is the starting line — every algorithm in this repo is an
unsolved exercise, and the tests are the specification you are working against.

If you want to see the machinery working before you write anything:

```bash
make verify-solutions
```

That applies all 27 reference answers, runs all six suites green, then puts your files back.

## Run

One at a time:

```bash
make run-python   # http://localhost:8000  — Swagger UI at /docs
make run-node     # http://localhost:3000  — Swagger UI at /docs
make run-php      # http://localhost:8080
```

Or all three:

```bash
make run-all
```

## First request

```bash
curl -s localhost:8000/problems/two-sum \
  -H 'content-type: application/json' \
  -d '{"nums":[2,7,11,15],"target":9}' | jq
```

Before you have solved anything, that returns **501** and tells you where to go:

```json
{ "error": { "type": "not_implemented",
             "message": "two-sum / hash-map is an exercise you have not solved yet.",
             "details": [{ "field": "approach",
                           "message": "Write your solution in packages/core-python/src/neetcode_core/arrays_and_hashing/two_sum.py" }] } }
```

Solve it, and the same request against `:8000`, `:3000` and `:8080` returns identical JSON.

Try the other implementation:

```bash
curl -s 'localhost:8000/problems/two-sum?approach=brute-force' \
  -H 'content-type: application/json' \
  -d '{"nums":[2,7,11,15],"target":9}' | jq '.approach, .elapsedMicros'
```

And the error paths — all three apps answer the same way:

```bash
# 404: well-formed input, no answer exists
curl -s localhost:8000/problems/two-sum -H 'content-type: application/json' \
  -d '{"nums":[1,2,3],"target":100}' | jq

# 422: input is not valid
curl -s localhost:8000/problems/two-sum -H 'content-type: application/json' \
  -d '{"nums":[1],"target":1}' | jq
```

## Explore

```bash
curl -s localhost:8000/problems | jq            # catalog of everything solved
curl -s localhost:8000/problems/two-sum | jq    # metadata for one problem
open http://localhost:8000/docs                 # FastAPI's generated Swagger UI
open http://localhost:3000/docs                 # NestJS's, via @nestjs/swagger
```

## Solve your first problem

```bash
cat docs/problems/0001-two-sum.md
```

The brief names three files — one per language. Each holds a stub per approach. Replace the
`raise` / `throw` with your own code and leave the rest alone:

```
packages/core-python/src/neetcode_core/arrays_and_hashing/two_sum.py
packages/core-ts/src/arrays-and-hashing/two-sum.ts
packages/core-php/src/ArraysAndHashing/TwoSum.php
```

Then:

```bash
make test-python        # fastest feedback while you work
make test               # all six suites once you have all three
```

Stuck? `make show SLUG=two-sum` prints a worked answer without touching a file.

Solved it? Read [`solutions/notes/0001-two-sum.md`](../solutions/notes/0001-two-sum.md) and
compare — that is where most of the value is, and it only works once you have three
implementations of your own to compare against.

## Where to go next

- [01 — Architecture](01-architecture.md) — why the layers are where they are.
- [02 — Adding a problem](02-adding-a-problem.md) — authoring a new exercise.
- [06 — Language & framework comparison](06-language-comparison.md) — the interesting part.

## Troubleshooting

**`Could not find packages/contracts/problems`** — all three core packages locate the
contracts by walking up from the working directory. Run commands from inside the repo, or set
`NEETCODE_CONTRACTS_DIR` to an absolute path.

**`No module named 'tests'` from pytest** — you are running a `pytest` binary that is not the
one in `.venv`. Use `make test-python`.

**`UnsolvedError` / `UnsolvedException` everywhere** — expected. That is what an unsolved
exercise raises. `make status` shows what is still a stub.

**`make solution` overwrote something I wanted** — `make restore`. Every overwrite is backed up
to `.neetcode-backup/` first.

**`neetcode/core` not found by Composer** — run `composer install` inside
`packages/core-php` first; the app's path repository points at that directory.

**NestJS cannot resolve `@neetcode/core`** — run `npm run build --workspace @neetcode/core`.
The app imports the built `dist/`, not the source. `make setup-node` does this for you.
