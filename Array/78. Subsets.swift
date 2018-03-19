class Solution {
  var res: [[Int]]
  var nums: [Int]
  var temArr: [Int]
  init() {
    self.res = []
    self.nums = []
    self.temArr = []
  }
  func subsets(_ nums: [Int]) -> [[Int]] {
    self.res = []
    self.nums = nums
    self.temArr = []
    self.backTracking(temArr:[], index:0)
    return self.res
  }
  func backTracking (
    temArr: [Int],
    index: Int
  ) {
    var temCopy = temArr
    self.res.append(temCopy)
    guard index < nums.count else {
      return
    }
    for i in index..<nums.count {
      self.temArr.append(nums[i])
      backTracking(
        temArr: self.temArr,
        index: i + 1
      )
      self.temArr.removeLast()
    }
  }
}
class Solution1 {
  func subsets(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    for n in nums {
      for r in res {
        res.append(r + [n])
      }
      res.append([n])
    }
    res.append([])
    return res
  }
}
let testcase = [1, 2, 3]
let solution = Solution()
let solution1 = solution1()
solution.subsets(testcase)
solution1.subsets(testcase)
