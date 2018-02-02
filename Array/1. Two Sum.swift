class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for i in 0..<nums.count {
            var delta = target - nums[i]
            if map[delta] != nil {
                return [map[delta]!, i]
            } else {
                map[nums[i]] = i
            }
        }
        return []
    }
}
let testcase = [3,2,4]
let target = 6
let solution = Solution()
solution.twoSum(testcase, target)
