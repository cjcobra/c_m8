//
//  MainVC.swift
//  CoreLocationVideo
//
//  Created by Chanse Jackson on 12/14/15.
//  Copyright © 2015 ali farhat. All rights reserved.
//

import Foundation
import UIKit

class MainVC: UIViewController, UIPopoverPresentationControllerDelegate {
    
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
    
    // Report
    
    @IBAction func pressedReportBtn(sender: UIButton) {
        print("pushedReportBtn")
        
        self.performSegueWithIdentifier("showReport", sender: self)

    }
    
    // could be for all buttons
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "showReport"
        {
            var vc = segue.destinationViewController as! UIViewController
            vc.preferredContentSize = CGSize(width: view.frame.width, height: view.frame.height - 250)
            
            var controller = vc.popoverPresentationController
            
            if controller != nil
            {
                controller?.delegate = self
            }
        }
    }
    
    // at the end.
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
    // end Report
    
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