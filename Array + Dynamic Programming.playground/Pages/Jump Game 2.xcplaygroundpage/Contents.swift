import Foundation

/// Time O(n)           Space O(1)
func jump(_ nums: [Int]) -> Int {
    var maxReachable = 0, last = 0, i = 0, jumps = 0
    
    while last < nums.count - 1 {
        maxReachable = max(maxReachable, i + nums[i])
        if i == last {
            last = maxReachable
            jumps += 1
        }
        
        i += 1
    }
    
    return jumps
}

/// Example:    correct answer = 2
let ex1 = jump([2,3,1,1,4])
print(ex1, "\n")


// MARK: - Tests

let tests: [(nums: [Int], answer: Int)] = [
    ([2,3,1,1,4], 2),
    ([2,3,0,1,4], 2),
    
    ([4, 2, 0, 4, 0, 5, 2], 2),
    ([2, 1, 6, 4, 0], 2),
    ([2, 1, 4, 0, 1, 4, 5, 4, 0, 4], 3),
    
    ([6], 0),
    ([4, 2], 1),
    ([4, 1, 2, 6, 2, 4, 6, 3, 1, 3, 2, 1, 6, 3, 5], 4),
    ([3, 1, 0, 3, 1], 2),
    ([1, 1], 1),
    ([1, 1, 2, 5, 1, 4, 4, 5, 1, 3, 2, 5], 5),
    ([6, 6, 4, 6, 5, 0, 2, 6, 5, 1, 2, 1], 3),
]

for (i, test) in tests.enumerated() {
    let res = jump(test.nums)
    print("Test_\(i):   expected = \(test.answer)   |   returned = \(res)   |   \(test.answer == res)\n")
}

