class Solution {
  func maxChunksToSorted(_ arr: [Int]) -> Int {
    var res = 0
    var maxNum = 0
    for i in 0..<arr.count {
      maxNum = max(maxNum, arr[i])
      if maxNum == i {
        res += 1
      }
    }
    return res
  }
}
var testcase = [1, 0, 2, 3, 4]
let solution = Solution()
solution.maxChunksToSorted(testcase)
