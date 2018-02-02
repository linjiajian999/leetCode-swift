// 713. Subarray Product Less Than K
// https://leetcode.com/problems/subarray-product-less-than-k/description/
class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        if k <= 1 { return 0 }
        var res = 0
        var left = 0
        var product = 1
        for right in 0..<nums.count {
            product *= nums[right]
            while product >= k && left <= right {
                product /= nums[left]
                left += 1
            }
            res += right - left + 1
        }
        return res
    }
}
var solution = Solution()
var testcase = [10, 5, 2, 6]
var k = 100
solution.numSubarrayProductLessThanK(testcase, k)
