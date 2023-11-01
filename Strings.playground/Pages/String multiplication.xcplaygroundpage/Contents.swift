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








// MARK: - other methods

/// time O(n2)              space O(n2)
func sum(_ a: String, _ b: String) -> String {
    if a.count >= b.count {
        var i = a.count - 1, j = b.count - 1
        var s = "", carry = false
        
        while j >= 0 || i >= 0  {
            let idx = a.index(a.startIndex, offsetBy: i)
            let jdx = j >= 0 ? b.index(b.startIndex, offsetBy: j) : b.startIndex
            var ss = Int("\(a[idx])")! + (j >= 0 ? Int("\(b[jdx])")! : 0) + (carry ? 1 : 0)
            
            carry = ss >= 10
            ss -= carry ? 10 : 0
            s = "\(ss)" + s
            
            i -= 1
            j -= 1
        }
        
        return carry ? "1" + s : s
    }
    
    return sum(b, a)
}

func multByDigit(_ a: String, _ d: String) -> String {
    let digit = Int(d)!
    var s = "0"
    for _ in 0..<digit {
        s = sum(s, a)
    }
    
    return s
}

func multiply(_ a: String, _ b: String) -> String {
    var mults: [String] = []
    
    for i in 0..<b.count {
        let idx = b.index(b.startIndex, offsetBy: i)
        mults.append(multByDigit(a, "\(b[idx])"))
    }
    
    var s: String = "0"
    for i in 0..<mults.count {
        let zeros = String([Character](repeating: Character("0"), count: mults.count - i - 1))
        let qq = mults[i] + zeros
        s = sum(qq, s)
    }
    
    return "\(s[s.startIndex])" == "0" ? "0" : s
}


func multiply2(_ a: String, _ b: String) -> String {
    var arr = [Int](repeating: 0, count: a.count + b.count)
    var r = ""
    
    for i in (0..<a.count).reversed() {
        let idx = a.index(a.startIndex, offsetBy: a.count - i - 1)
        for j in (0..<b.count).reversed() {
            let jdx = b.index(b.startIndex, offsetBy: b.count - j - 1)
            arr[i + j] += Int("\(a[idx])")! * Int("\(b[jdx])")!
        }
    }
    print(arr)
    
    for i in 0..<arr.count {
        let n = arr[i]
        arr[i] = n % 10

        if i < arr.count - 1 {
            arr[i+1] += (n / 10)
        }

        r = "\(arr[i])" + r
    }
    print(r)
    
    var j = 0
    while j < r.count - 1, r[r.index(r.startIndex, offsetBy: j)] == "0" {
        j += 1
    }
    print()

    return "\(r[r.index(r.startIndex, offsetBy: j)..<r.endIndex])"
}


