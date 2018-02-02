class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        guard nums.count > 2  else {
            return res
        }
        let sortNums = nums.sorted { (a, b) -> Bool in
            return a < b
        }
        for i in 0..<sortNums.count-2 {
            guard sortNums[i] <= 0 else {
                break
            }
            guard i == 0 || (i > 0 && sortNums[i] != sortNums[i - 1]) else {
                continue
            }
            var left = i + 1
            var right = sortNums.count - 1
            let target = 0 - sortNums[i]
            while left < right {
                let sum = sortNums[left] + sortNums[right]
                if sum == target {
                    res.append([sortNums[i], sortNums[left], sortNums[right]])
                    while left < right && sortNums[left] == sortNums[left+1] {
                        left += 1
                    }
                    while left < right && sortNums[right] == sortNums[right-1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if sum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return res
    }
}
var solu = Solution()
solu.threeSum([0, 0, 0])
