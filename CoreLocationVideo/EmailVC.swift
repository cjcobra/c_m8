//
//  EmailVC.swift
//  CoreLocationVideo
//
//  Created by Chanse Jackson on 12/16/15.
//  Copyright © 2015 ali farhat. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class EmailVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    //, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var subjectTextField: UITextField!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    @IBOutlet weak var emailButton: UIButton!
    
    ////////////////////////////////
    //
    //  viewDidLoad
    //
    ////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("EmailC didload")
        // Do any additional setup after loading the view, typically from a nib.
        
        // Recall Haz
        var savedHazType = NSUserDefaults.standardUserDefaults().stringForKey("myHazTypeKey")
        
        // Recall Dec
        var savedDesIssue = NSUserDefaults.standardUserDefaults().stringForKey("myDecIssueKey")
        
        // Recall Gen Loc
        var savedDesGenLoc = NSUserDefaults.standardUserDefaults().stringForKey("myGenLocKey")
        
        // Recall Dropped Pin Loc
        var savedPinnedLoc = NSUserDefaults.standardUserDefaults().stringForKey("myPinnedLocKey")
        
        
        print(" ----- Email Data -----")
        print("Issue Type: ", savedHazType)
        print("Issue Description: ", savedDesIssue)
        print("Issue General Location: ", savedDesGenLoc)
        print("Dropped Pin Coord: ", savedPinnedLoc)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let toRecipients1 = ["cjcobra2@gmail.com"]  // need brackets around for email
    let messageBody = "This is the body"
    
    @IBAction func pushedEmailBtn(sender: UIButton) {
        //Check to see the device can send email.
        if( MFMailComposeViewController.canSendMail() ) {
            print("Can send email.")
            
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            
            //Set the subject and message of the email
            mailComposer.setToRecipients(toRecipients1)
            mailComposer.setSubject("Hello")
            mailComposer.setMessageBody(messageBody, isHTML: false)
            
            // Attachment Stuff
            
            print("---- Recall PicPath ----")
            // Recall PicPath
            var savedPicPath = NSUserDefaults.standardUserDefaults().stringForKey("myPicPathKey")
            print("savedPicPath: ", savedPicPath)
            
            
            /*  ORIG        if let filePath = NSBundle.mainBundle().pathForResource("swifts", ofType: "wav") {
            print("File path loaded.")
            
            if let fileData = NSData(contentsOfFile: filePath) {
            print("File data loaded.")
            mailComposer.addAttachmentData(fileData, mimeType: "audio/wav", fileName: "swifts")
            }
            }
            
            // Version 2
            let imageData = UIImagePNGRepresentation(UIImage(named: "image.png")!)
            myController.addAttachmentData(imageData!, mimeType: "image/png", fileName: "image")
            */
            self.presentViewController(mailComposer, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
} // end all