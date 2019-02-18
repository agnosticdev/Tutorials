//
//  ViewController.swift
//  NetworkConnectivity
//
//  Created by Matt Eaton on 1/30/19.
//  Copyright © 2019 Matt Eaton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var connectivityStatusContainer: UIView!
    @IBOutlet private weak var connectivityStatus: UILabel! // Connectivity Status Label
    
    @IBOutlet private weak var requestContainer: UIView!
    @IBOutlet private weak var requestContainerInstruction: UILabel! // Connectivity Instructions
    @IBOutlet private weak var requestContainerButton: UIButton! // Request Data Button
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add outline to our views for visibility
        connectivityStatusContainer.addShadow()
        requestContainer.addShadow()
        
        // Instruct the NetworkManagerDelegate that ViewController conforms to the protocol.
        NetworkManager.shared.delegate = self
        
        // Set the initial connectivityStatus before a request is made.
        connectivityStatus.text = "Connection Status: Unknown"
    }

    
    @IBAction private func requestDataTapped() {  // IBAction for Request Data Button
        connectivityStatus.text = "Connection Status: Checking"
        NetworkManager.shared.getRequest()
    }
}

extension ViewController: NetworkManagerDelegate {
    // Success response that uses the response tuple to set the connectivity status and instruction.
    func networkFinishedWithData(response: (String, String, [String : AnyObject])) {
        DispatchQueue.main.async { [weak self] in
            self?.connectivityStatus.text = "Connection Status: \(response.0)"
            self?.requestContainerInstruction.text = response.1
        }
    }
    // Error response that uses the response tuple to set the connectivity status and instruction.
    func networkFinishedWithError(response: (String, String, [String : AnyObject])) {
        DispatchQueue.main.async { [weak self] in
            self?.connectivityStatus.text = "Connection Status: \(response.0)"
            self?.requestContainerInstruction.text = response.1
        }
    }
    
}

