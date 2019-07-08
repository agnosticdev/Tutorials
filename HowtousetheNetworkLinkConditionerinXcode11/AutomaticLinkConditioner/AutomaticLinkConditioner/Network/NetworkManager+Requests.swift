//
//  NetworkManager+Requests.swift
//  AutomaticLinkConditioner
//
//  Created by Matt Eaton on 6/10/19.
//  Copyright © 2019 Matt Eaton. All rights reserved.
//

import Foundation


extension NetworkManager {
    
    // Utility method to respond on the main thread usign the NetworkDelegate
    // Normally passing in a closure here would work too.
    func respondToMainThread(response: String) {
        DispatchQueue.main.async {
            self.networkDelegate?.networkTimeElapsed(response: response)
        }
    }
    
    func getRequest() {
        
        guard let getURL = URL(string: getSampleURL) else {
            return
        }
        
        var getRequest = URLRequest(url: getURL)
        getRequest.httpMethod = "GET"
        
        // Set the URLSession configuration
        let urlSession = URLSession(configuration: urlConfiguration)
        
        let dateStart = Date()
        print("Request Started: \(dateStart)")
        // Send the GET dataTask here
        let getRequestTask = urlSession.dataTask(with: getRequest, completionHandler: { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                self.respondToMainThread(response: "Malformed HTTPURLResponse Failure - Error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            let timeSinceNow = dateStart.timeIntervalSinceNow
            let timeElapsed = String(format: "Request Time: %.4f - Status: \(httpResponse.statusCode)", (abs(timeSinceNow)))
            
            // Ensure that an error is not present, otherwise, return the error along with the message
            if let unwrappedError = error {
                self.respondToMainThread(response: "\(timeElapsed) - Error: \(String(describing: unwrappedError.localizedDescription))")
                return
            }
            
            // Fall through and respond with a successful response.
            self.respondToMainThread(response: timeElapsed)
            
        })
        getRequestTask.resume()
        
    }
}
