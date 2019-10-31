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
    
    
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    // 3. This function is called when Phone receives message from Watch
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        // 1. When a message is received from the watch, output a message to the UI
        // NOTE: Since session() runs in background, you cannot directly update UI from the background thread.
        // Therefore, you need to wrap any UI updates inside a DispatchQueue for it to work properly.
        DispatchQueue.main.async {}
        
        // 2. Also, print a debug message to the phone console
        // To make the debug message appear, see Moodle instructions
        print("Received a message from the watch: \(message)")
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
            let message = ["imagename":"pikachu"]as [String : Any]
            
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
            let message = ["imagename": "caterpie"] as [String :  Any]
            
            // Send the message
            WCSession.default.sendMessage(message, replyHandler:nil)
            messageLabel.text = "Message Sucessfully Sent"}
        else {
            messageLabel.text = "Cannot reach watch!"
            
        }
    }
    
    
}

