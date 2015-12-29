//
//  MainVC.swift
//  CoreLocationVideo
//
//  Created by Chanse Jackson on 12/14/15.
//  Copyright © 2015 ali farhat. All rights reserved.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var homeBtn: UIButton!
    
    @IBOutlet weak var reportBtn: UIButton!
    
    @IBOutlet weak var trackBtn: UIButton!
    
    @IBOutlet weak var settingsBtn: UIButton!
    
    @IBOutlet weak var alertsBtn: UIButton!
    
////////////////////////////////
//
//  viewDidLoad
//
////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    ////////////////////////////////
    //
    //  Button Actions
    //
    ////////////////////////////////
    
    @IBAction func pressedHomeBtn(sender: UIButton) {
        print("pushedHomeBtn")
        
        
    }
    
    @IBAction func pressedReportBtn(sender: UIButton) {
        print("pushedReportBtn")
        
        
    }
    
    @IBAction func pressedTrackBtn(sender: UIButton) {
        print("pushedTrackBtn")
        
        
    }
    

    @IBAction func pressedSettingsBtn(sender: UIButton) {
        print("pushedSettingsBtn")
        
        
    }
    
    @IBAction func pressedAlertsBtn(sender: UIButton) {
        print("pushedAlertsBtn")
        
        
    }
    


}  // end all