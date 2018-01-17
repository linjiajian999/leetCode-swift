//: Playground - noun: a place where people can play

class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if (nums.count < 2) {
            return nums.count
        }
        var res: Int = 1
        var preMax: Int = 1
        for i in 1..<nums.count {
            if (nums[i] > nums[i-1]) {
                res += 1
            } else {
                res = 1
            }
            preMax = max(res, preMax)
        }
        return preMax
    }
}
var a = Solution()
print(a.findLengthOfLCIS([1, 2, 3, 4]))
