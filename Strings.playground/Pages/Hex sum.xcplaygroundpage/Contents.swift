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



func sumT(_ a: String, _ b: String) -> String {
    // Step 1: Convert hex strings to decimal integers
    let a = a.isEmpty ? "0" : a
    let b = b.isEmpty ? "0" : b
    
    guard
        let aDecimal = Int(a, radix: 16),
        let bDecimal = Int(b, radix: 16)
    else {
        return ""
    }
    
    // Step 2: Add the decimal integers together
    let sumDecimal = aDecimal + bDecimal
    
    // Step 3: Convert the result back to a hex string
    let hexString = String(sumDecimal, radix: 16)
    
    // Step 4: Return the hex string
    return hexString
}

/*
 
 Generated_Test___0    |   true
 a: 8920c
 b: 7df17989b
 e: 7df202aa7
 r: 7df202aa7

 Generated_Test___1    |   true
 a: 4cad055
 b: 976f1
 e: 4d44746
 r: 4d44746

 Generated_Test___2    |   true
 a: e0b
 b: 368fe
 e: 37709
 r: 37709

 Generated_Test___3    |   true
 a: b3
 b: 5bd3
 e: 5c86
 r: 5c86

 Generated_Test___4    |   true
 a: 7c2e7fe7ec
 b:
 e: 7c2e7fe7ec
 r: 7c2e7fe7ec

 Generated_Test___5    |   true
 a: 333b
 b: ab90
 e: decb
 r: decb

 Generated_Test___6    |   true
 a: 796eb1426
 b: c2c1934aa
 e: 13c30448d0
 r: 13c30448d0

 Generated_Test___7    |   true
 a: 11
 b: ba9619ff
 e: ba961a10
 r: ba961a10

 Generated_Test___8    |   true
 a: 7e58eb580d
 b: b372cb5
 e: 7e642284c2
 r: 7e642284c2

 Generated_Test___9    |   true
 a: a6ead95
 b:
 e: a6ead95
 r: a6ead95

 Generated_Test___10    |   true
 a: 234cc33de
 b: b3f
 e: 234cc3f1d
 r: 234cc3f1d

 Generated_Test___11    |   true
 a: 8f9
 b:
 e: 8f9
 r: 8f9

 Generated_Test___12    |   true
 a: ac6fc4126
 b: 2
 e: ac6fc4128
 r: ac6fc4128

 Generated_Test___13    |   true
 a: 867a90
 b: 884dd
 e: 8eff6d
 r: 8eff6d

 Generated_Test___14    |   true
 a: 808cc
 b:
 e: 808cc
 r: 808cc

 Generated_Test___15    |   true
 a: 92631
 b: e04b
 e: a067c
 r: a067c

 Generated_Test___16    |   true
 a: 2008
 b: 2157
 e: 415f
 r: 415f

 Generated_Test___17    |   true
 a: 390d
 b: 92cc3
 e: 965d0
 r: 965d0

 Generated_Test___18    |   true
 a: 8962d58
 b: b6c318
 e: 94cf070
 r: 94cf070

 Generated_Test___19    |   true
 a: e4dc3206
 b: ac9865541
 e: bae628747
 r: bae628747


 
 */
