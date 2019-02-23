//
//  NetworkResponse.swift
//  NetworkConnectivity
//
//  Created by Matt Eaton on 2/2/19.
//  Copyright © 2019 Matt Eaton. All rights reserved.
//

import Foundation


enum NetworkResponse: String {
    
    case networkData
    case networkError
    
    // This is an example for the NetworkConnectivity Turorial.
    // In a real life situation, the enum could be further built out to display actual objects being passed back insted of [String: AnyObject].
    // This would also be an excellent opportunity to use Codables.
    static func getNetworkResponse(networkResponse: NetworkResponse, data: [String: AnyObject] = [:], error: Error?) -> (String, String, [String: AnyObject]) {
        
        switch networkResponse {
            
        case .networkData:
            return (
                "Online",
                "Based upon your last network request, you connectivity is good.",
                data
            )
        case .networkError:
            
            var connectionStatus = "Online"
            var errorInstuction = error?.localizedDescription ?? "Failed to Parse JSON"

            if let nsError = error as NSError? {
                let errorCode = nsError.code
                /// -1009 is the offline error code
                /// HTTP load failed (error code: -1009)
                if errorCode == -1009 {
                    connectionStatus = "Offline"
                    errorInstuction = "Please check you internet connection and try your request again."
                }
            }
            return (
                connectionStatus,
                errorInstuction,
                data
            )
            
        }
        
    }
}
