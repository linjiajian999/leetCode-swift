class Solution {
  func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var arr = [Int](repeating: 1, count: n)
    for i in 1..<m {
      for j in 1..<n {
        arr[j] += arr[j - 1]
      }
    }
    return arr[n - 1]
  }
}
let m = 3
let n = 7
let solution = Solution()
solution.uniquePaths(m, n)