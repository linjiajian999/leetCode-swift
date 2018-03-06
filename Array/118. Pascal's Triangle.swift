// https://leetcode.com/problems/pascals-triangle/description/
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else {
            return []
        }
        var result = [[Int]](repeating: [1], count: numRows)
        for i in 1..<numRows {
            for j in 1..<i {
                result[i].append(result[i-1][j-1] + result[i-1][j])
            }
            result[i].append(1)
        }
        return result
    }
}
let testcase = 6
let solution = Solution()
solution.generate(testcase)
