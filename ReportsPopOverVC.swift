//
//  ReportsPopOverVC.swift
//  CoreLocationVideo
//
//  Created by Chanse Jackson on 12/29/15.
//  Copyright © 2015 ali farhat. All rights reserved.
//

import Foundation
import UIKit

class ReportsPopOverVC: UIViewController {
    

    
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
    //  Road Hazard Button
    //
    ////////////////////////////////
    
    @IBAction func pressedRoadHazardBtn(sender: UIButton) {
        print("pressedRoadHazardBtn")
        
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
 //       alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        // Potholes, hazardous road conditions or road maintenance concerns
        
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
        switch action.style{
        case .Default:
            print("default")

        case .Cancel:
            print("cancel")

        case .Destructive:
            print("destructive")
        }
        }))
        

        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    ////////////////////////////////
    //
    //  Right of Way Button
    //
    ////////////////////////////////
    
    @IBAction func pressedRightOfWayBtn(sender: UIButton) {
        print("pressedRightOfWayBtn")
        
        // Sidewalk repair, landscaping, street sign replacement, downed tree, and all other concerns or issues with the city right of way
        
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
        //       alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        // Potholes, hazardous road conditions or road maintenance concerns
        
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                print("default")
                
            case .Cancel:
                print("cancel")
                
            case .Destructive:
                print("destructive")
            }
        }))
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    ////////////////////////////////
    //
    //  Public Facility Button
    //
    ////////////////////////////////
    
    
    
    ////////////////////////////////
    //
    //  Utility Service Button
    //
    ////////////////////////////////
    
    
    
    
    ////////////////////////////////
    //
    //  Code Violation Button
    //
    ////////////////////////////////
    
    
    
    
    ////////////////////////////////
    //
    //  Info / Other Button
    //
    ////////////////////////////////


} // end all
