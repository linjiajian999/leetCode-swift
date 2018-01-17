//: Playground - noun: a place where people can play
class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        var max1: Int = Int.min
        var max2: Int = Int.min
        var max3: Int = Int.min
        var min1: Int = Int.max
        var min2: Int = Int.max
        for num in nums {
            if (num > max1) {
                max3 = max2
                max2 = max1
                max1 = num
            } else if (num > max2) {
                max3 = max2
                max2 = num
            } else if (num > max3) {
                max3 = num
            }
            if (num < min1) {
                min2 = min1
                min1 = num
            } else if (num < min2) {
                min2 = num
            }
        }
        return max(max3 * max2 * max1, min1 * min2 * max1)
    }
}
