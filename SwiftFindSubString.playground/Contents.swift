//: Playground - noun: a place where people can play

import UIKit

/*let string = "Hello Agnosticdev, I love Tutorials"
let substring = "Agnosticdev"

if string.contains(substring) {
    print("I found: \(substring)")
}*/


// Alternative Options

let string = "Hello Agnosticdev, I love Tutorials"
let substring = "Agnosticdev"
var index = 0

// Loop through parent string looing for the first character of the substring
for char in string.characters {
    if substring.characters.first == char {
        // Create a start and end index to ultimately creata range
        //
        // Hello Agnosticdev, I love Tutorials
        //       6   ->   17 - rage of substring from 7 to 18
        //
        let startOfFoundCharacter = string.index(string.startIndex, offsetBy: index)
        let lengthOfFoundCharacter = string.index(string.startIndex, offsetBy: (substring.characters.count + index))
        let range = startOfFoundCharacter..<lengthOfFoundCharacter
        
        // Grab the substring from the parent string and compare it against substring
        // Essentially, looking for the needle in a haystack
        if string.substring(with: range) == substring {
            print("Found: \(substring)")
            break
        }

    }
    index += 1
}