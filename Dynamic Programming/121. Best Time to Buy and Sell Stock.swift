class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var res = 0
        var minPrice = Int.max
        for item in prices {
            res = max(res, item - minPrice)
            minPrice = min(minPrice, item)
        }
        return res
    }
}
var testcese = [7, 1, 5, 3, 6, 4]
var solution = Solution()
solution.maxProfit(testcese)
