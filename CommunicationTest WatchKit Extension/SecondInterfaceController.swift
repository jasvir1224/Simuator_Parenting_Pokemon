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
    
    @IBOutlet weak var pokemonstate: WKInterfaceLabel!
    
    @IBOutlet weak var hungerLabel: WKInterfaceLabel!
    
    @IBOutlet weak var imageView: WKInterfaceImage!
    
    var count:Int = 0
    var heath:Int = 100
    var hunger:Int = 0
    var time = Timer()
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
    }

    
    @IBAction func feedButton() {
        if(self.hunger >= 0 ){
            self.hunger = self.hunger + 10}
    }
    
    func timer(){
        self.time = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: Selector(("updation")), userInfo: nil, repeats: true)
    }
    
    func updation(){
        self.count = self.count + 1
        if(self.heath == 0){
            self.pokemonstate.setText("Pokemon is dead")
        }
        self.hunger = self.hunger + 10
        
        if(self.hunger >= 80 ){
            self.heath = self.heath - 10
        }
       
}
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        super.willActivate()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
       
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func hibernateButton() {
      if (WCSession.default.isReachable == true) {
    // Here is the message you want to send to the watch
    // All messages get sent as dictionaries
    let message = ["Hunger":"\(self.hunger)",
    "Health": "\(self.heath))" ] as [String : Any]
    
    WCSession.default.sendMessage(message, replyHandler:nil)
    }
    
}
}
