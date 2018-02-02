// 766. Toeplitz Matrix
// https://leetcode.com/problems/toeplitz-matrix/description/
class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                if matrix[i][j] != matrix[i + 1][j + 1] {
                    return false
                }
            }
        }
        return true
    }
}
var testcase = [[1,2,3,4],[5,1,2,3],[9,5,1,2]]
var solution = Solution()
solution.isToeplitzMatrix(testcase)
