//
//  ViewController.swift
//  CoreLocationVideo
//
//  Created by Ali Farhat on 6/20/15.
//  Copyright (c) 2015 ali farhat. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import AssetsLibrary

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var pinnedLatLongLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var lblLocation: UILabel!
    var locationManager = CLLocationManager()
    var myPosition = CLLocationCoordinate2D()
    
    var timer = NSTimer()
    
    // creae a variable destination for directions
    
    var destination:MKMapItem = MKMapItem()
    
    var library:ALAssetsLibrary = ALAssetsLibrary()
    
    
    ////////////////////////////////
    //
    //  viewDidLoad
    //
    ////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewControllerVC didload")
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Added back from Orig
        let locCoord = CLLocationCoordinate2D(latitude: 25.123, longitude: 55.123)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = locCoord
        annotation.title = "My Location "
        annotation.subtitle = "Location of store"
        
        mapView.addAnnotation(annotation)
        // end added back
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ////////////////////////////////
    //
    //  Pushed Next Button
    //
    ////////////////////////////////
    
    @IBAction func pushedNextBtn(sender: UIButton) {
        
        self.takeScreenShot()
        
        locationManager.stopUpdatingLocation()
        
    }
    ////////////////////////////////
    //
    //  Get current location
    //
    ////////////////////////////////
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
        // Print current location
        print("Current Location \(newLocation.coordinate.latitude) , \(newLocation.coordinate.longitude) ")
        
        myPosition = newLocation.coordinate
        
        
        
        //       locationManager.stopUpdatingLocation()
        
        lblLocation.text = "\(newLocation.coordinate.latitude) , \(newLocation.coordinate.longitude) "
        
        let span = MKCoordinateSpanMake(0.005, 0.005)
        let region = MKCoordinateRegion(center: newLocation.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        // stop getting locaton after 5 seconds
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target:self, selector: Selector("stopUpdatingLocationFunction"), userInfo: nil, repeats: false)
        
    }
    
    
    
    ////////////////////////////////
    //
    //  Add PIN
    //
    ////////////////////////////////
    
    @IBAction func addPin(sender: UILongPressGestureRecognizer) {  // Was UILongPGR
        
        //     locationManager.startUpdatingLocation()
        
        let location = sender.locationInView(self.mapView)
        
        let locCoord = self.mapView.convertPoint(location, toCoordinateFromView: self.mapView)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = locCoord
        annotation.title = "Issue found here"
        
        //First Convert it to NSNumber.
        let lat : NSNumber = NSNumber(double: locCoord.latitude)
        let lng : NSNumber = NSNumber(double: locCoord.longitude)
        
        let placeMark = MKPlacemark(coordinate: locCoord, addressDictionary: nil)
        destination = MKMapItem(placemark: placeMark)
        self.mapView.removeAnnotations(mapView.annotations)
        self.mapView.addAnnotation(annotation)
        
        let pinnedLatLong = String(lat,lng)
        
        //Store Dropped Pin Position
        NSUserDefaults.standardUserDefaults().setObject(pinnedLatLong, forKey: "myPinnedLocKey")
        
        // pinnedLatLongLabel.text = String(lat,lng)  // working
        pinnedLatLongLabel.text = pinnedLatLong
        
        //Store that Dictionary into NSUserDefaults
        NSUserDefaults.standardUserDefaults().setObject(pinnedLatLong, forKey: "myPinnedCoordKey")
        
        // Recall
        let droppedPinLoc = NSUserDefaults.standardUserDefaults().stringForKey("myPinnedCoordKey")
        
        print("droppedPinLoc: ",droppedPinLoc)
        
        // stop getting locaton after 5 seconds
        //        timer = NSTimer.scheduledTimerWithTimeInterval(5, target:self, selector: Selector("stopUpdatingLocationFunction"), userInfo: nil, repeats: false)
        
    }
    
    
    ////////////////////////////////
    //
    //  Screen shot
    //
    ////////////////////////////////
    
    // full screen shot first
    // saveScreenshot("\(realHomeDirectory)/Screenshots/\(deviceType)_\(screenResolution)_Screenshot1.png")
    
    func takeScreenShot() {
        print("takeScreenShot")
        
        // Start Full Screen Shot
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        var sourceImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //       UIImageWriteToSavedPhotosAlbum(sourceImage, nil, nil, nil)
        // End full Screen Shot
        
        // Get partial screen shot
        UIGraphicsBeginImageContext(mapView.frame.size)
        sourceImage.drawAtPoint(CGPointMake(-25, -100))  // was -60m,-75
        var croppedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //       UIImageWriteToSavedPhotosAlbum(croppedImage, nil, nil, nil)
        
        // add path
        var imageData = UIImageJPEGRepresentation(croppedImage, 0.6)
        var compressedJPGImage = UIImage(data: imageData!)
        
        // Write to CameraRoll and also get Path
        ALAssetsLibrary().writeImageToSavedPhotosAlbum(compressedJPGImage!.CGImage, orientation: ALAssetOrientation(rawValue: compressedJPGImage!.imageOrientation.rawValue)!,
            completionBlock:{ (path:NSURL!, error:NSError!) -> Void in
                print("\(path)")
                var picPath:String = "\(path)"
                
                //Store path
                NSUserDefaults.standardUserDefaults().setObject(picPath, forKey: "myPicPathKey")
                
                //            let data: NSData? = NSData(contentsOfFile: picPath)
                
        })
        
        
    }
    
    // ?? Not sure about this one...
    class func getImageFromPath(path: String, onComplete:((image: UIImage?) -> Void)) {
        let assetsLibrary = ALAssetsLibrary()
        let url = NSURL(string: path)!
        assetsLibrary.assetForURL(url, resultBlock: { (asset) -> Void in
            onComplete(image: UIImage(CGImage: asset.defaultRepresentation().fullResolutionImage().takeUnretainedValue()))
            }, failureBlock: { (error) -> Void in
                onComplete(image: nil)
        })
    }
    
    
    
    
    
    
    
    ////////////////////////////////
    //
    //  Refresh my location
    //
    ////////////////////////////////
    
    
    @IBAction func updateMyLocation(sender: UIButton) {
        print("Refresh location and Screenshot")
        
        self.takeScreenShot()
        
        locationManager.startUpdatingLocation()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target:self, selector: Selector("stopUpdatingLocationFunction"), userInfo: nil, repeats: false)
    }
    
    ////////////////////////////////
    //
    //  Stop updating my location
    //
    ////////////////////////////////
    
    func stopUpdatingLocationFunction() {
        print("Stop Updating Location")
        locationManager.stopUpdatingLocation()
        
    }
    
}  // end all