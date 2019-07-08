//
//  NetworkManager.swift
//  AutomaticLinkConditioner
//
//  Created by Matt Eaton on 6/9/19.
//  Copyright © 2019 Matt Eaton. All rights reserved.
//

import Foundation

import Foundation


// NetworkManager class to make the network request.
class NetworkManager: NSObject {
    
    
    //
    // MARK: - Static Class Constants
    //
    static let shared = NetworkManager()
    
    //
    // MARK: - Public instance properties
    //
    public weak var networkDelegate: NetworkProtocol?
    
    //
    // MARK: - Public constants
    //
    public let urlConfiguration = URLSessionConfiguration.default
    public let getSampleURL = "https://api.nasa.gov/planetary/apod?api_key=NNKOjkoul8n1CH18TWA9gwngW1s1SmjESPjNoUFo"
    
    private override init() {
        urlConfiguration.timeoutIntervalForRequest = 15.0
        urlConfiguration.timeoutIntervalForResource = 15.0
    }
    
}
