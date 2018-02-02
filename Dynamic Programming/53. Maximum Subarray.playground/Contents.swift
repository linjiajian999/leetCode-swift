class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var currentMaxSum = nums[0]
        var res = nums[0]
        for i in 1..<nums.count {
            currentMaxSum = max(nums[i], currentMaxSum + nums[i])
            res = max(res, currentMaxSum)
        }
        return res
    }
}
class Solution1 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = Int.min
        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]
            maxSum = max(sum, maxSum)
            if sum < 0 {
                sum = 0
            }
        }
        return maxSum
    }
}
var testcase = [-2,1,-3,4,-1,2,1,-5,4]
var solution = Solution()
var solution1 = Solution1()
solution.maxSubArray(testcase)
solution.maxSubArray(testcase)
