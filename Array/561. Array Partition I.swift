class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var res : Int = 0
        let sortnums: [Int] = nums.sorted()
        for i in 0..<(sortnums.count / 2) {
            res += nums[i * 2]
        }
        return res
    }
}
class Solution1 {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var res : Int = 0
        var i : Int = 0
        let sortnums: [Int] = nums.sorted()
        while i < sortnums.count - 1 {
            res += sortnums[i]
            i += 2
        }
        return res
    }
}
var testcase = [1, 4, 3, 2]
var solution = Solution()
var solution1 = Solution1()
solution.arrayPairSum(testcase)
solution1.arrayPairSum(testcase)
