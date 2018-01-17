//: Playground - noun: a place where people can play
class Solution {
    func arrayNesting(_ nums: [Int]) -> Int {
        var res = 0
        var tags = [Int](repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            guard tags[i] != -1 else {
                continue
            }
            var index = nums[i]
            var count = 0
            var tem = 0
            while tags[index] != -1 {
                tem = index
                tags[index] = -1
                index = nums[index]
                count += 1
            }
            res = max(res, count)
        }
        return res
    }
}
