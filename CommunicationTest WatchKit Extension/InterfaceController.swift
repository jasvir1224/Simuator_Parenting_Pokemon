//
//  InterfaceController.swift
//  CommunicationTest WatchKit Extension
//
//  Created by Jasvir Kaur on 2019-10-31.
//  Copyright © 2019 Lampton. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController ,
WCSessionDelegate{
    
    
    
    @IBOutlet weak var imageLabel: WKInterfaceImage!
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        _ = message["imagename"] as! String
        imageLabel.setImage(UIImage(named: "imagename"))
        
        
        print("WATCH: Got message from Phone")
       
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func nameButton() {
    }
    

}
