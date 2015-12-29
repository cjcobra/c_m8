//
//  CameraVC.swift
//  CoreLocationVideo
//
//  Created by Chanse Jackson on 12/16/15.
//  Copyright © 2015 ali farhat. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices
import MessageUI  // mail

class CameraVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {  // mail = MFMailComposeViewControllerDelegate
    
    
    @IBOutlet weak var imageView: UIImageView!
    var newMedia: Bool?
    
    ////////////////////////////////
    //
    //  viewDidLoad
    //
    ////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CameraVC didload")
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    ////////////////////////////////
    //
    //  Camera Button Actions
    //
    ////////////////////////////////
    
    @IBAction func useCamera(sender: AnyObject) {
        
        print("useCamera")
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.Camera) {
                
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType =
                    UIImagePickerControllerSourceType.Camera
                imagePicker.mediaTypes = [kUTTypeImage as NSString as String]
                imagePicker.allowsEditing = false
                
                self.presentViewController(imagePicker, animated: true,
                    completion: nil)
                newMedia = true
                
                // Add email stuff
                
                //   let tempImage = editingInfo[UIImagePickerControllerOriginalImage] as UIImage
                
                
                
        }
        
    }
    
    // test other buttons
    
    @IBAction func cameraRollBtn(sender: UIButton) {
        print("useCameraRoll")
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.SavedPhotosAlbum) {
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType =
                    UIImagePickerControllerSourceType.PhotoLibrary
                imagePicker.mediaTypes = [kUTTypeImage as NSString as String]
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true,
                    completion: nil)
                newMedia = false
        }
    }
    
    @IBAction func cameraBtn(sender: UIButton) {
        
        print("useCamera")
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.Camera) {
                
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType =
                    UIImagePickerControllerSourceType.Camera
                imagePicker.mediaTypes = [kUTTypeImage as NSString as String]
                imagePicker.allowsEditing = false
                
                self.presentViewController(imagePicker, animated: true,
                    completion: nil)
                newMedia = true
                
                // Add email stuff
                
                //   let tempImage = editingInfo[UIImagePickerControllerOriginalImage] as UIImage
                
                
                
        }
    }
    
    // end test buttons
    
/*
    @IBAction func useCameraRoll(sender: AnyObject) {
        
        print("useCameraRoll")
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.SavedPhotosAlbum) {
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType =
                    UIImagePickerControllerSourceType.PhotoLibrary
                imagePicker.mediaTypes = [kUTTypeImage as NSString as String]
                imagePicker.allowsEditing = false
                self.presentViewController(imagePicker, animated: true,
                    completion: nil)
                newMedia = false
        }
        
    }
*/
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        if mediaType == (kUTTypeImage as String) {
            print("kUT as String")
            let image = info[UIImagePickerControllerOriginalImage]
                as! UIImage
            
            imageView.image = image
            
            if (newMedia == true) {
                print("newMedia == true")
                UIImageWriteToSavedPhotosAlbum(image, self,
                    "image:didFinishSavingWithError:contextInfo:", nil)
            } else if mediaType == (kUTTypeMovie as String) {
                // Code to support video here
            }
            
        }
    }
    
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafePointer<Void>) {
        
        if error != nil {
            let alert = UIAlertController(title: "Save Failed",
                message: "Failed to save image",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                style: .Cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true,
                completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("cancel image")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}  // end all
