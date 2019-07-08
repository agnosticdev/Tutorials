//
//  ViewController.swift
//  AutomaticLinkConditioner
//
//  Created by Matt Eaton on 6/9/19.
//  Copyright © 2019 Matt Eaton. All rights reserved.
//

import UIKit

public protocol NetworkProtocol: class {
    //
    // MARK: - Notify the user interface once the network is finished loading
    //
    func networkTimeElapsed(response: String)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var testRequest: UIButton!
    @IBOutlet weak var requestTimeSuperView: UIView!
    @IBOutlet weak var requestTimeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.networkDelegate = self
        
        testRequest.layer.borderColor = UIColor(red: 115.0/255.0, green: 128.0/250.0, blue: 190.0/255.0, alpha: 1.0).cgColor
        testRequest.layer.borderWidth = 1.0
        testRequest.layer.cornerRadius = 4.0
        
        requestTimeSuperView.layer.borderColor = UIColor(red: 51.0/255.0, green: 51.0/250.0, blue: 51.0/255.0, alpha: 1.0).cgColor
        requestTimeSuperView.layer.borderWidth = 1.0
        requestTimeSuperView.layer.cornerRadius = 4.0
        
    }

    @IBAction func sendDataTapped() {
        requestTimeLabel.text = "Making Network Request..."
        NetworkManager.shared.getRequest()
    }
}

//
// MARK: - Network Protocol
//
extension ViewController: NetworkProtocol {
    
    func networkTimeElapsed(response: String) {
        requestTimeLabel.text = "\(response)"
    }
}
