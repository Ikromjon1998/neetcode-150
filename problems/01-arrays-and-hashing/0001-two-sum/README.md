# 1. Two Sum

**Difficulty:** Easy
**Link:** https://leetcode.com/problems/two-sum/

## Problem

Given an array of integers `nums` and an integer `target`, return the indices of the two
numbers that add up to `target`. Exactly one solution exists; an element may not be used twice.

## Approach

Single pass with a hash map from value → index. For each element, check whether
`target - nums[i]` was already seen; if so, return both indices, otherwise store the current one.

## Complexity

- Time: O(n)
- Space: O(n)
