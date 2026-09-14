# NeetCode 150 — Python, TypeScript, PHP

Solutions to the [NeetCode 150](https://neetcode.io/practice) problem set, each implemented in
**Python**, **TypeScript** and **PHP**, with tests for every language.

## Layout

```
problems/
  01-arrays-and-hashing/
    0001-two-sum/
      README.md        # problem statement, approach, complexity
      two_sum.py         # Python file is named after the problem (unique module name)
      test_two_sum.py
      solution.ts
      solution.test.ts
      solution.php
      SolutionTest.php
  02-two-pointers/
  ...
_template/             # copy this to start a new problem
```

Folder name = `<leetcode-id>-<slug>`. Topics follow the NeetCode 150 roadmap order.

## Run tests

```bash
make test        # all three languages
make test-py     # pytest
make test-ts     # vitest
make test-php    # phpunit
```

Setup once: `make setup` (installs npm and composer deps; Python needs only `pip install pytest`).

## Add a problem

```bash
./scripts/new-problem.sh 02-two-pointers 0125-valid-palindrome
```

## Progress

| # | Topic | Done |
|---|-------|------|
| 01 | Arrays & Hashing | 1 / 8 |
| 02 | Two Pointers | 0 / 5 |
| 03 | Sliding Window | 0 / 6 |
| 04 | Stack | 0 / 7 |
| 05 | Binary Search | 0 / 7 |
| 06 | Linked List | 0 / 11 |
| 07 | Trees | 0 / 15 |
| 08 | Tries | 0 / 3 |
| 09 | Heap / Priority Queue | 0 / 7 |
| 10 | Backtracking | 0 / 9 |
| 11 | Graphs | 0 / 13 |
| 12 | Advanced Graphs | 0 / 6 |
| 13 | 1-D DP | 0 / 12 |
| 14 | 2-D DP | 0 / 11 |
| 15 | Greedy | 0 / 8 |
| 16 | Intervals | 0 / 6 |
| 17 | Math & Geometry | 0 / 8 |
| 18 | Bit Manipulation | 0 / 7 |
