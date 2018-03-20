class Solution {
  func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    let m = obstacleGrid.count
    let n = obstacleGrid[0].count
    var resArr: [Int] = [Int](repeating: 1, count: n)
    guard n > 0 else {
      return 0
    }
    var isStop = false
    for i in 0..<n {
      if obstacleGrid[0][i] == 1 {
        isStop = true
      }
      resArr[i] = isStop ? 0 : 1
    }
    guard m > 1 else {
      return resArr[n-1]
    }
    for i in 1..<m {
      if obstacleGrid[i][0] == 1 {
        resArr[0] = 0
      }
      for j in 1..<n {
        if obstacleGrid[i][j] == 1 {
          resArr[j] = 0
        } else {
          resArr[j] += resArr[j-1]
        }
      }
    }
    return resArr[n-1]
  }
}