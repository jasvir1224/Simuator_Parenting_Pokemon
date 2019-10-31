//
//  SecondInterfaceController.swift
//  CommunicationTest WatchKit Extension
//
//  Created by Jasvir Kaur on 2019-10-31.
//  Copyright © 2019 Lampton. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class SecondInterfaceController: WKInterfaceController , WCSessionDelegate {
    
    
    @IBOutlet weak var healthLabel: WKInterfaceLabel!
    
    
    @IBOutlet weak var hungerLabel: WKInterfaceLabel!
    
    @IBOutlet weak var imageView: WKInterfaceImage!
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
    }
    
    @IBAction func feedButton() {
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    

}
