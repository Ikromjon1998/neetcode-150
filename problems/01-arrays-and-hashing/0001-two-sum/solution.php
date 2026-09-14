<?php

declare(strict_types=1);

namespace NeetCode\P1TwoSum;

final class Solution
{
    /**
     * @param int[] $nums
     * @return int[]
     */
    public function twoSum(array $nums, int $target): array
    {
        $seen = [];
        foreach ($nums as $i => $n) {
            $complement = $target - $n;
            if (isset($seen[$complement])) {
                return [$seen[$complement], $i];
            }
            $seen[$n] = $i;
        }
        return [];
    }
}
