<?php

declare(strict_types=1);

namespace NeetCode\P1TwoSum;

use PHPUnit\Framework\TestCase;

final class SolutionTest extends TestCase
{
    public function testBasic(): void
    {
        $this->assertSame([0, 1], (new Solution())->twoSum([2, 7, 11, 15], 9));
    }

    public function testLaterPair(): void
    {
        $this->assertSame([1, 2], (new Solution())->twoSum([3, 2, 4], 6));
    }

    public function testDuplicates(): void
    {
        $this->assertSame([0, 1], (new Solution())->twoSum([3, 3], 6));
    }
}
