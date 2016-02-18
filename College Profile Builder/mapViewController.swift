//
//  mapViewController.swift
//  College Profile Builder
//
//  Created by JScharm on 2/11/16.
//  Copyright © 2016 JScharm. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController
{
    @IBOutlet weak var myMapView: MKMapView!
    
    var name = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        geoCodeLocation(name)
        
    }
    
    func geoCodeLocation(Location: String)
    {
        let myGeoCode = CLGeocoder()
        myGeoCode.geocodeAddressString(Location) { (placeMarks, error) -> Void in
            if error != nil
            {
                print("error")
            }
            else
            {
                self.displayMap((placeMarks?.first)!)
            }
        }
    }
    
    func displayMap(MyPlacemark: CLPlacemark)
    {
        let myPin = MKPointAnnotation()
        name = MyPlacemark.name!
        let myLocation = MyPlacemark
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake((myLocation.location?.coordinate)!, span)
        myMapView.setRegion(region, animated: true)
        myPin.coordinate = (myLocation.location?.coordinate)!
        myPin.title = MyPlacemark.name
        myMapView.addAnnotation(myPin)
    }
  

}
