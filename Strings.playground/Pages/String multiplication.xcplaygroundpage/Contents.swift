import Foundation

///   time O(n2)    space O(1) -> O(n)
///   Multiplication and Sum
///   `arr[i + j + 1] = a[i] * b[j]`
///   then sum counting `carry`
///   here `carry` can be more than `1`
///   then remove extra suffix zeros
func multiply3(_ a: String, _ b: String) -> String {
    var arr = [Int](repeating: 0, count: a.count + b.count)
    var r = ""
    
    // decimals multiplication and sum
    for i in 0..<a.count {
        let idx = a.index(a.startIndex, offsetBy: i)
        for j in (0..<b.count).reversed() {
            let jdx = b.index(b.startIndex, offsetBy: j)
            arr[i + j + 1] += Int("\(a[idx])")! * Int("\(b[jdx])")!
        }
    }

    // sum with carry
    for i in (0..<arr.count).reversed() {
        let n = arr[i]
        arr[i] = n % 10
        
        if i > 0 {
            arr[i-1] += (n / 10)
        }
        
        r = "\(arr[i])" + r
    }
    
    // remove zeros
    var j = 0
    while j < r.count - 1, r[r.index(r.startIndex, offsetBy: j)] == "0" {
        j += 1
    }

    return "\(r[r.index(r.startIndex, offsetBy: j)..<r.endIndex])"
}




print(multiply3("2","34"))






