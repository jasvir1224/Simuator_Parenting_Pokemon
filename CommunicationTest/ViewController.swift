//
//  ViewController.swift
//  CommunicationTest
//
//  Created by Jasvir Kaur on 2019-10-31.
//  Copyright © 2019 Lampton. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    
    
    @IBOutlet weak var state: UILabel!
    
    @IBOutlet weak var healthLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    // 3. This function is called when Phone receives message from Watch
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        let hunger = message["hunger"] as! String
        let health = message["health"] as! String

        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        else {
            print("Phone does not support WCSession")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    @IBAction func pikachuButton(_ sender: UIButton) {
        if (WCSession.default.isReachable == true) {
            // Here is the message you want to send to the watch
            // All messages get sent as dictionaries
            let message = ["name": "pikachu" ]as [String : Any]
            
            // Send the message
            WCSession.default.sendMessage(message, replyHandler:nil)
            messageLabel.text = "Message Succesfully Sent"}
        else {
            messageLabel.text = "Cannot reach watch!"
            
        }
        
    }
    
    
    @IBAction func caterpieButton(_ sender: UIButton) {
        
        if (WCSession.default.isReachable == true) {
            // Here is the message you want to send to the watch
            // All messages get sent as dictionaries
            let message = ["name": "caterpie"] as [String :  Any]
            
            // Send the message
            WCSession.default.sendMessage(message, replyHandler:nil)
            messageLabel.text = "Message Sucessfully Sent"}
        else {
            messageLabel.text = "Cannot reach watch!"
            
        }
    }
    
    
}

