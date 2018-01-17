class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var sum = 0
        let length = nums.count
        if length < 4 {
            for i in 0..<length {
                sum += nums[i]
            }
            return sum
        }
        let sorNums = nums.sorted { (a, b) -> Bool in
            return a < b
        }
        var res = 0
        var min = Int.max
        for i in 0..<length-2 {
            var left = i + 1
            var right = length - 1
            while left < right {
                sum = sorNums[i] + sorNums[left] + sorNums[right]
                let delta = abs(sum - target)
                if delta < min {
                    min = delta
                    res = sum
                }
                if sum < target {
                    left += 1
                } else if sum > target {
                    right -= 1
                } else {
                    return sum
                }
            }
        }
        return res
    }
}
let solu = Solution()
solu.threeSumClosest([0,2,1,-3], 1)
