//
//  NetworkManager.swift
//  NetworkConnectivity
//
//  Created by Matt Eaton on 1/30/19.
//  Copyright © 2019 Matt Eaton. All rights reserved.
//

import Foundation



class NetworkManager: NSObject {
    
    
    //
    // MARK: - Static Class Constants
    //
    static let shared = NetworkManager()
    
    //
    // MARK: - Variables and Properties
    //
    weak var delegate: NetworkManagerDelegate?
    
    //
    // MARK: - Public constants
    //
    public let urlConfiguration = URLSessionConfiguration.default  // (1) Request Setup or Execution
    public let getSampleURL = "https://httpbin.org/get?arg1=1&arg2=2" // (1) Request Setup or Execution
    
}
