//: Playground - noun: a place where people can play

import UIKit

// --- Multi-line string literal example ---

let multiLineString = """
                      Line One
                      Line Two
                      Line Three
                      """
print("Multi-Line String: \(multiLineString)")







// --- Multi-line string literal with interpolation ---

var lineNumbers = [1, 2, 3]
let multiLineTemplate = """
                        Line: \(lineNumbers[0])
                        Line: \(lineNumbers[1])
                        Line: \(lineNumbers[2])
                        """
print("\nMulti-Line String Template: \(multiLineTemplate)")








// --- Manipulating a multi-line string ---

// Creating Substring
var mutableMultiLineString = """
                             Hello AgnosticDev!
                             I really enjoy tutorials.
                             Especially Swift Tutorials!
                             """
let startingIndex = mutableMultiLineString.index(mutableMultiLineString.startIndex, offsetBy: 19)
let endingIndex = mutableMultiLineString.index(mutableMultiLineString.startIndex, offsetBy: 44)
let range = startingIndex..<endingIndex
let substring = mutableMultiLineString.substring(with: range)
print("Second line: \(substring)")



// Replacing Values
let replacedString = mutableMultiLineString.replacingOccurrences(of: " ", with: "\n")
print("Replaced value string: \(replacedString)")









// --- String Equality ---
let nonEqualMultiLineString = """
                              Hello AgnosticDev!
                              I really enjoy tutorials. Especially Swift Tutorials!
                              """
if mutableMultiLineString == nonEqualMultiLineString {
    print("Multi-line strings are equal!")
} else {
    print("No, these are not equal strings because of the missing newline, even though both strings have the same length.")
    print("Length of mutableMultiLineString: \(mutableMultiLineString.characters.count)")
    print("Length of nonEqualMultiLineString: \(nonEqualMultiLineString.characters.count)")
}

