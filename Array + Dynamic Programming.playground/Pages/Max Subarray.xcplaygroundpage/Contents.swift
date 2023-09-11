import Foundation

/// Time O(n)           Space O(n)
func maxSubarray(_ nums: [Int]) -> Int {
    let n = nums.count
    
    /// This array will store best option for the each postition
    var dp: [Int] = .init(repeating: nums[0], count: n)
    
    /// To find maximum subarray sum
    var mx = dp[0]

    /// Since we need maximum subbarray
    /// We need to consider only positives
    /// If previous one `dp[i-1]` is psitive then, current `dp[i]`   is   `nums[i] + dp[i-1]`
    /// Otherwise, `dp[i] = nums[i]`
    /// Concurrently, we need to store maximum sum that we get
    for i in 1..<n {
        
        /* One way to write it
            dp[i] = nums[i]
            if dp[i-1] > 0 {
                dp[i] += dp[i - 1]
            }
        */
        
        ///                     Ternary operator syntax
        dp[i] = nums[i] + ( dp[i-1] > 0 ? dp[i-1] : 0 )
        mx = max(dp[i], mx)
    }

    return mx
}

/// Example:    correct answer = 6
let ms1 = maxSubarray( [-2,1,-3,4,-1,2,1,-5,4] )
print(ms1, "\n")


// MARK: - Tests

let tests: [(nums: [Int], answer: Int)] = [
    ([-2,1,-3,4,-1,2,1,-5,4], 6),
    ([1], 1),
    ([5,4,-1,7,8], 23)
]

for (i, test) in tests.enumerated() {
    let res = maxSubarray(test.nums)
    print("Test_\(i):   expected = \(test.answer)   |   returned = \(res)   |   \(test.answer == res)\n")
}



// MARK: - Get max subbary

func getMaxSubarray(_ nums: [Int]) -> (sum: Int, subarray: [Int]) {
    let n = nums.count
    var dp: [Int] = .init(repeating: nums[0], count: n)
    var mx = dp[0]
    
    /// To sotre the id of the max subbarry sum
    var id = 0

    /// When mx is changed, then store the `i` in `id`
    for i in 1..<n {
        dp[i] = nums[i] + ( dp[i-1] > 0 ? dp[i-1] : 0 )
        if dp[i] > mx {
            mx = dp[i]
            id = i
        }
    }
    
    /// Then do kind of a backtracking
    /// Since we know the sum, we can go backwards from the `id` and subtracting from `tmp` while `tmp > 0`
    /// And insert the `nums[id]` in the begining of the  `subbarray`, which enitially is empty
    var tmp = mx
    var subarray: [Int] = []
    while tmp > 0 {
        subarray.insert(nums[id], at: 0)
        tmp -= nums[id]
        id -= 1
    }

    return (mx, subarray)
}

/// Example:    correct answer = 6
let ms2 = getMaxSubarray( [-2,1,-3,4,-1,2,1,-5,4] )
print(ms1, "\n")


// MARK: - Tests

let tests2: [(nums: [Int], answer: Int, subarray: [Int])] = [
    ([-2,1,-3,4,-1,2,1,-5,4], 6, [4,-1,2,1]),
    ([1], 1, [1]),
    ([5,4,-1,7,8], 23, [5,4,-1,7,8])
]

for (i, test) in tests2.enumerated() {
    let res = getMaxSubarray(test.nums)
    print("Test_\(i)")
    print("\(test.answer == res.sum)---|--- expected = \(test.answer)")
    print("       |--- returned = \(res.sum)")
    print("\(test.subarray == res.subarray)---|--- expected subarray = \(test.subarray)")
    print("       |--- returned subarray = \(res.subarray)\n")
}
