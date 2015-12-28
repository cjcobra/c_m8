//
//  AddDescription.swift
//  CoreLocationVideo
//
//  Created by Chanse Jackson on 12/15/15.
//  Copyright © 2015 ali farhat. All rights reserved.
//

import Foundation
import UIKit

class AddDescription: UIViewController {
    
//    @IBOutlet weak var Scroller: UIScrollView!
    
    @IBOutlet weak var hazardType: UILabel!
    @IBOutlet weak var describeIssue: UITextField!
    @IBOutlet weak var describeGeneralLocation: UITextField!
    
    @IBOutlet weak var decIssueTextView: UITextView!
    @IBOutlet weak var decGenLocTextView: UITextView!

    @IBOutlet weak var issueDetailedDescription: UILabel!
//    @IBOutlet weak var pickerView: UIPickerView!
    
//    var pickerDataSource = ["Please choose Issue Type...","Road Hazard", "Right-of-Way Maintenance", "Public Facility Maintenance", "Code Enforcement Violation", "Utility Service/Repair", "Website", "Other"];
    
//    var selectedRow = 0
    
////////////////////////////////
//
//  viewDidLoad
//
////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AddDescriptionVC didload")
        // Do any additional setup after loading the view, typically from a nib.
        
 //       Scroller.contentInset = UIEdgeInsetsMake(0, 0, 800, 0)
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
  //      self.pickerView.dataSource = self;
  //      self.pickerView.delegate = self;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*
    ////////////////////////////////
    //
    //  Picker Stuff
    //
    ////////////////////////////////
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    // detect row selection
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        
        if(row == 0) {
            print("Please choose an Issue Type Selected")
            selectedRow = 0
        }
        else if(row == 1) {
            print("Road Hazard Selected")
            selectedRow = 1
            issueDetailedDescription.text = "Potholes, hazardous road conditions or road maintenance concerns"
        }
        else if(row == 2) {
            print("Right-of-Way Maint Selected")
            selectedRow = 2
            issueDetailedDescription.text = "Sidewalk repair, landscaping, street sign replacement, downed tree, and all other concerns or issues with the city right of way"
        }
        else if(row == 3) {
            print("Public Facility Maint Selected")
            selectedRow = 3
            issueDetailedDescription.text = "Facility repair and  maintenance concerns or suggestions for public facilities including city buildings, parks, lands, etc"
        }
        else if(row == 4) {
            print("Code Enforcement Selected")
            selectedRow = 4
            issueDetailedDescription.text = "Report any code enforcement issues: illegal dumping, high weeds or grass, nuisance/unsafe/unsanitary property conditions and all other concerns or issues related to private property"
        }
        else if(row == 5) {
            print("Utility Service/Repair Maint Selected")
            selectedRow = 5
            issueDetailedDescription.text = "Broken water line, sewer line, life station alarm or other utility repair or emergency"
        }
        else if(row == 6) {
            print("Website Selected")
            selectedRow = 6
            issueDetailedDescription.text = "Building Permits, event permits"
        }
        else if(row == 7) {
            print("Other Selected")
            selectedRow = 7
            issueDetailedDescription.text = "Any other comments or concerns"
        }
        else
        {
            print("Nothing Selected")
        }
        
        //Store Hazard Type
        NSUserDefaults.standardUserDefaults().setObject(pickerDataSource[selectedRow], forKey: "myHazTypeKey")
        
        //Store selected Row
        NSUserDefaults.standardUserDefaults().setObject(selectedRow, forKey: "myRowValueKey")

    }
*/
    
    ////////////////////////////////
    //
    //  Dismiss Keyboard
    //
    ////////////////////////////////
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
/*
    ////////////////////////////////
    //
    //  Scroller Set up
    //
    ////////////////////////////////
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.Scroller.frame = self.view.bounds
        self.Scroller.contentSize.height = 800
        self.Scroller.contentSize.width = 0
        
    }
*/
    
////////////////////////////////
//
//  go to Next Step Button
//
////////////////////////////////

    
    @IBAction func goToNextStepBtn(sender: UIButton) {
    
    print("gotoNextStepBtn")
        
        // Recall row selected
/*        var savedSelectedRow = NSUserDefaults.standardUserDefaults().integerForKey("myRowValueKey")
        print("savedSelectedRow: %@",savedSelectedRow)
        
        if savedSelectedRow == 0 {
            // please choose a type
        }
        else if savedSelectedRow > 7 {
            // Out of rannge
        }
        
        else {
*/
        
        var myValue2:NSString = decIssueTextView.text!
        var myValue3:NSString = decGenLocTextView.text!

        //Store Issue Desciption
        NSUserDefaults.standardUserDefaults().setObject(myValue2, forKey: "myDecIssueKey")
        
        //Store General Location
        NSUserDefaults.standardUserDefaults().setObject(myValue3, forKey: "myGenLocKey")
        
        print("---- Test Recalled Data ----")
        // Recall Haz
        var savedHazType = NSUserDefaults.standardUserDefaults().stringForKey("myHazTypeKey")
        
        // Recall
        var savedDesIssue = NSUserDefaults.standardUserDefaults().stringForKey("myDecIssueKey")
        
        // Recall
        var savedDesGenLoc = NSUserDefaults.standardUserDefaults().stringForKey("myGenLocKey")
        
        print("haztype: ", savedHazType)
        print("describeIssue: ", savedDesIssue)
        print("describeGeneralLocation: ", savedDesGenLoc)
        
   //     self.performSegueWithIdentifier("ViewController", sender: self)
    
      //  } // end else
    }
    
    

}