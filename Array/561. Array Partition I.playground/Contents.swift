//: Playground - noun: a place where people can play
class Solution {
//    func arrayPairSum(_ nums: [Int]) -> Int {
//        var res : Int = 0
//        var i : Int = 0
//        let sortnums: [Int] = nums.sorted()
//        while i < sortnums.count - 1 {
//            res += sortnums[i]
//            i += 2
//        }
//        return res
//    }
    func arrayPairSum(_ nums: [Int]) -> Int {
        var res : Int = 0
        let sortnums: [Int] = nums.sorted()
        for i in 0..<(sortnums.count / 2) {
           res += nums[i * 2]
        }
        return res
    }
}
var a = Solution()
a.arrayPairSum([1, 4, 3, 2])
