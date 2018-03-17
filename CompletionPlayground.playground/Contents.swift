//: Playground - noun: a place where people can play

import UIKit


let declaredCompletionHandler: (Int) -> Void = {
    print("Declared completion constant value: \($0)")
}

func completionHandler(value: Int) {
    print("Function completion handler value: \(value)")
}

// 
func computeValue(start: Int, completion: (Int) -> Void) {
    
    var start = start
    for _ in 1...100 {
        start += 1
    }
    completion(start)
}

// Compute a value and then send the finished value to the function completion handler
computeValue(start: 1, completion: completionHandler)
// Compute a value and then send the finished value to the constant declared completion handler
computeValue(start: 1, completion: declaredCompletionHandler)
