<?php

declare(strict_types=1);

namespace NeetCode\Template;

use PHPUnit\Framework\TestCase;

final class SolutionTest extends TestCase
{
    public function testExample(): void
    {
        $this->assertNull((new Solution())->solve());
    }
}
