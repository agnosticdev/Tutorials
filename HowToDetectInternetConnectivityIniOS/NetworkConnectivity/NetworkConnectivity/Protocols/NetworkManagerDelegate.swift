//
//  NetworkManagerDelegate.swift
//  NetworkConnectivity
//
//  Created by Matt Eaton on 1/31/19.
//  Copyright © 2019 Matt Eaton. All rights reserved.
//

import Foundation


protocol NetworkManagerDelegate: class {
    
    func networkFinishedWithData(response: (String, String, [String: AnyObject]))
    func networkFinishedWithError(response: (String, String, [String: AnyObject]))
}
