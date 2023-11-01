import Foundation

let cd = [
    Character("0"): 0, Character("1"): 1,
    Character("2"): 2, Character("3"): 3,
    Character("4"): 4, Character("5"): 5,
    Character("6"): 6, Character("7"): 7,
    Character("8"): 8, Character("9"): 9,
    Character("a"): 10, Character("b"): 11,
    Character("c"): 12, Character("d"): 13,
    Character("e"): 14, Character("f"): 15,
]

let dc = [
    0: Character("0"), 1: Character("1"),
    2: Character("2"), 3: Character("3"),
    4: Character("4"), 5: Character("5"),
    6: Character("6"), 7: Character("7"),
    8: Character("8"), 9: Character("9"),
    10: Character("a"), 11: Character("b"),
    12: Character("c"), 13: Character("d"),
    14: Character("e"), 15: Character("f"),
]


/// time O(n)       space O(1) -> O(n)
/// Start from the end
/// sum and count carry
func sum(_ a: String, _ b: String) -> String {
    let a = Array(a.isEmpty ? "0" : a), b = Array(b.isEmpty ? "0" : b)
    
    var i = a.count - 1, j = b.count - 1
    var carry = false
    var res = ""
    
    while i >= 0 || j >= 0 {
        let h1 = i >= 0 ? cd[a[i]]! : 0
        let h2 = j >= 0 ? cd[b[j]]! : 0
        
        let sum = h1 + h2 + (carry ? 1 : 0)
        carry = sum >= 16
        
        res = "\(dc[sum % 16]!)" + res
        
        i -= 1
        j -= 1
    }
    
    return carry ? "1" + res : res
}




// MARK: - Generated TESTS
func runGT(_ gta: Int = 20) {
    
    for i in 0..<gta {
        let gac = Int.random(in: 0...10)
        let gbc = Int.random(in: 0...10)
        
        var a = ""
        var b = ""
        
        for _ in 0..<gac {
            a += a.isEmpty ? "\(dc[Int.random(in: 1..<16)]!)" : "\(dc[Int.random(in: 0..<16)]!)"
        }
        
        for _ in 0..<gbc {
            b += b.isEmpty ? "\(dc[Int.random(in: 1..<16)]!)" : "\(dc[Int.random(in: 0..<16)]!)"
        }
        
        let res = sum(a, b)
        let expected = sumT(a, b)
        print("Generated_Test___\(i)    |   \(res == expected)")
        print("a: \(a)")
        print("b: \(b)")
        print("e: \(expected)")
        print("r: \(res)\n")
        
    }
}

runGT()
