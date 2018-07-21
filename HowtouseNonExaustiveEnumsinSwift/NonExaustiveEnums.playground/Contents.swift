//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport
import UIKit
PlaygroundPage.current.needsIndefiniteExecution = true

// -------------------------------------------- //
// Server Responses in a Library
//
// https://github.com/apple/swift-evolution/blob/master/proposals/0192-non-exhaustive-enums.md
//
// -------------------------------------------- //



// This ENUM is in Swift currently, but the proposal states that this is to be used with C ENUMs.
enum ServerResponseCodes: Int {
    
    case OK = 200
    case Created = 201
    case Accepted = 202
    case NoContent = 204
    //case ResetContent = 205
    
    case MovedPermanently = 301
    case Found = 302
    case SeeOther = 303
    //case NotModified = 304
    //case UseProxy = 305
    
    case BadRequest = 400
    case Unauthorized = 401
    //case PaymentRequired = 402
    //case Forbidden = 403
    //case NotFound = 404
    //case MethodNotAllowed = 405
    //case NotAcceptable = 406
    //case RequestTimeout = 408
    
    case InternalServerError = 500
    case NotImplemented = 501
    case BadGateway = 502
    case ServiceUnavaiable = 503
    //case GatewayTimeout = 504
    //case HTTPVersionNotSupported = 505
}

// -------------------------------------------- //

// It is now a source-compatible change to add a case to a non-frozen enum (whether imported from C or defined in the standard library).
// It is not a source-compatible change to add a case to a frozen enum.
// It is still not a source-compatible change to remove a case from a public enum (frozen or non-frozen).
// It is a source-compatible change to change a non-frozen enum into a frozen enum, but not vice versa.
func getResponseStatus(responseCode: ServerResponseCodes) {
    // Swift 4.2 - 5.0 Non-Exaustive Enum Switch Statement
    #if swift(>=4.2)
        switch responseCode {
        case .OK:
            print("OK")
        case .Created:
            print("Created")
        case .Accepted:
            print("Accepted")
        case .NoContent:
            print("No Content")
        case .MovedPermanently:
            print("Moved Permanently")
        case .Found:
            print("Found")
        case .SeeOther:
            print("See Other")
        case .BadRequest:
            print("Bad Request")
        case .Unauthorized:
            print("Unauthorized")
        case .InternalServerError:
            print("Internal Server Error")
        case .NotImplemented:
            print("Not Implemented")
        case .BadGateway:
            print("Bad Gateway")
        
        // Emits a warning: Switch must be exhaustive
        @unknown default:
        
        // Does not emit a warning at all when a new case is added
        //default:
            // If any of these were added in our library.
            //case PaymentRequired = 402
            //case Forbidden = 403
            //case NotFound = 404
            //case MethodNotAllowed = 405
            print("Catch all for cases that could have been addd.")
            print("Emits a warning if new cases are added to the enum.")
        }
    // Swift 4.1 Enum Switch Statement
    // The Switch below results in an error
    #elseif swift(>=4.1)
        switch responseCode {
        case .OK:
            print("OK")
        case .Created:
            print("Created")
        case .Accepted:
            print("Accepted")
        case .NoContent:
            print("No Content")
        case .MovedPermanently:
            print("Moved Permanently")
        case .Found:
            print("Found")
        case .SeeOther:
            print("See Other")
        case .BadRequest:
            print("Bad Request")
        case .Unauthorized:
            print("Unauthorized")
        case .InternalServerError:
            print("Internal Server Error")
        case .NotImplemented:
            print("Not Implemented")
//     If all cases are switched through in an exhaustive manner, a default case is not needed.
//     Adding a new case to the enum results in: error: switch must be exhaustive
//        default:
//            print("Default Fall Through")
        }
    #endif
}


/**
 * Create a Network Call With URLSession.
 * Vanilla GET call to a JSON File on Rackspace.
 */
// Step 1: Create a URL.
let url = "https://5fc3d7589074cd0c4bf5-79ef711e857aec8d77eb74e0027f6262.ssl.cf1.rackcdn.com/articles.json"
guard let articleURL = URL(string: url) else {
    fatalError("Could not create a URL from the string based URI")
}

// Step 2: Create a URLRequest Object.
var articleRequest = URLRequest(url: articleURL)
articleRequest.httpMethod = "GET"

// Step 3: Create a URLSession Object with the default configuration
let urlConfiguration = URLSessionConfiguration.default
let urlSession = URLSession(configuration: urlConfiguration)
let articleTask = urlSession.dataTask(with: articleRequest, completionHandler: { (data, response, error) in
    // Notify the main thread to deal with the response code.
    DispatchQueue.main.async {
        // Step 4: Unwrap the response code and create a ServerResponseCode value from the rawValue.
        guard let r = response as? HTTPURLResponse,
            let responseCode = ServerResponseCodes(rawValue: r.statusCode) else {
            return
        }
        // Step 5: Check it against the ServerResponseCodes enum.
        getResponseStatus(responseCode: responseCode)
    }
})
articleTask.resume()
