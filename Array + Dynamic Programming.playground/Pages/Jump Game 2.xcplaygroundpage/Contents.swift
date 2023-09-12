import Foundation

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


let ex1 = jump([2,3,1,1,4])
print(ex1) // must be 2
