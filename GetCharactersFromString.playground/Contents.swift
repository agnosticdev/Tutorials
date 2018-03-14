//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Agnostic Dev"
var charArr: [Character] = ["A", "g", "n", "o", "s", "t", "i", "c"]

// Grab the first two characters
if str.prefix(2) == "He" {
    print("I found \(str.prefix(2))") // I found He
}

// Grab the last three characters
if str.suffix(3) == "Dev" {
    print("I found \(str.suffix(3))") // I found Dev
}

// First three from charArr: ["A", "g", "n"]
print("First three from charArr: \(charArr.prefix(3))")

// Last three from charArr: ["t", "i", "c"]
print("Last three from charArr: \(charArr.suffix(3))")


// Build your own String Extension for grabbing a character at a specific position
extension String {
    
    func index(at position: Int, from start: Index? = nil) -> Index? {
        let startingIndex = start ?? startIndex
        return index(startingIndex, offsetBy: position, limitedBy: endIndex)
    }
    
    func character(at position: Int) -> Character? {
        guard position >= 0, let indexPosition = index(at: position) else {
            return nil
        }
        return self[indexPosition]
    }
}

if let character = str.character(at: 3) {
    print("I found \(character)") // I found l
}

if let character = str.character(at: 31) {
    print("I found \(character)") // Will not return due to a position too large
}




