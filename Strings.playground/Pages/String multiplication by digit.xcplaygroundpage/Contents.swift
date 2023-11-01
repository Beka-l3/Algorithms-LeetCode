import Foundation


func multiplyByDigit(_ num: inout String, _ digit: String) {
    var i = num.count - 1, idx = num.index(num.startIndex, offsetBy: i), carry = 0
    let d = Int(digit)!
    
    while i >= 0 {
        idx = num.index(num.startIndex, offsetBy: i)
        
        let s = d * Int("\(num[idx])")! + carry
        num.replaceSubrange(idx...idx, with: "\(s % 10)")
        carry = s / 10
        
        i -= 1
    }
    
    if carry > 0 {
        num.insert(Character("\(carry)"), at: num.startIndex)
    }
}

