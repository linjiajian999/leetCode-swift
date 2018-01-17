//: Playground - noun: a place where people can play
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var res = 0
        var left = 0
        var right = height.count - 1
        var temRes = 0
        while left < right {
            if height[left] < height[right] {
                temRes = (right - left) * height[left]
                left += 1
            } else {
                temRes = (right - left) * height[right]
                right -= 1
            }
            if temRes > res {
                res = temRes
            }
        }
        return res
    }
}
