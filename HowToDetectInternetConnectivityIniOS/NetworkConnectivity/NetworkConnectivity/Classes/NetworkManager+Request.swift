//
//  NetworkManager+Request.swift
//  NetworkConnectivity
//
//  Created by Matt Eaton on 1/31/19.
//  Copyright © 2019 Matt Eaton. All rights reserved.
//

import Foundation

//
// MARK: - Network Manager Extension for Single Requests
//
extension NetworkManager {


    func getRequest() {
        
        guard let getURL = URL(string: getSampleURL) else {
            return
        }
        
        var getRequest = URLRequest(url: getURL)  // (1) Request Setup or Execution
        getRequest.httpMethod = "GET"
        
        let urlSession = URLSession(configuration: urlConfiguration) // (1) Request Setup or Execution
        
        // Send the GET dataTask here
        let getRequestTask = urlSession.dataTask(with: getRequest, completionHandler: { [weak self] (data, response, error) in
            
            // Ensure that an error is not present, otherwise, return the error along with the message
            if let networkError = error {  // (2) Response Error Processing
                self?.delegate?.networkFinishedWithError(response: NetworkResponse.getNetworkResponse(networkResponse: .networkError,
                                                                                                    error: networkError))
                return
            }
            
            // Perform the JSONSerialization and send back data as long as the statusCode is good
            do {
                if let networkData = data, networkData.count > 0,
                    let networkJSON = try JSONSerialization.jsonObject(with: networkData, options: []) as? [String: AnyObject] {
                    
                    // Send back the network Server error response here
                    if let httpResponse = response as? HTTPURLResponse,
                        httpResponse.statusCode >= 500 {
                        // (2) Response Error Processing
                        let error: NSError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Sever Error"])
                        self?.delegate?.networkFinishedWithError(response: NetworkResponse.getNetworkResponse(networkResponse: .networkError,
                                                                                                            data: networkJSON,
                                                                                                            error: error))
                        return
                    }
            
                    // (3) Response Success Processing
                    self?.delegate?.networkFinishedWithData(response: NetworkResponse.getNetworkResponse(networkResponse: .networkData,
                                                                                                       data: networkJSON,
                                                                                                       error: error))
                    return

                }
            } catch _ as NSError {
                // Do something with the error here.
            }
            // (2) Response Error Processing
            // Send back a failure.  In this case the JSON would fail to parse to [String: AnyObject]
            self?.delegate?.networkFinishedWithError(response: NetworkResponse.getNetworkResponse(networkResponse: .networkError,
                                                                                                error: error))
            
        })
        getRequestTask.resume() // (1) Request Setup or Execution
        
    }
    
}
