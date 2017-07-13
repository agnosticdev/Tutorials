//: Playground - noun: a place where people can play

import UIKit

// Swift 3 information
// https://stackoverflow.com/questions/39676939/how-does-string-index-work-in-swift-3

// Swift 4 information
// https://github.com/apple/swift-evolution/blob/master/proposals/0172-one-sided-ranges.md

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}

var str = "Hello, One-sided Ranges!"
guard let i = str.index(of: ",") else {
    throw "Not safe to continue on! 😎"
}

// First slice with new range implementation for Swift 4, a lot less verbose
let firstSliceWithComma = str[...i] // Hello,
let firstSliceUptoComma = str[..<i] // Hello

// Swift 3 implementation, very similar, but on two lines
let firstSliceRangeUptoComma = str.startIndex..<i
str[firstSliceRangeUptoComma] // Hello
let firstSliceRangeWithComma = str.startIndex...i
str[firstSliceRangeWithComma] // Hello,



// Second slice with new range implementation for Swift 4
let secondSliceWithComma = str[i...] //, One-sided Ranges!

// Swift 3 implementation, very similar, but on two lines
let secondSliceRangeWithComma = i..<str.endIndex
str[secondSliceRangeWithComma]




