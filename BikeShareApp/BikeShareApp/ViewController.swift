//
//  ViewController.swift
//  BikeShareApp
//
//  Created by Elvina Tse on 2015-11-19.
//  Copyright © 2015 Elvina Tse. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    
    // Create an endpoint (link to API)
    var endpoint = NSURL(string: "http://www.bikesharetoronto.com/stations/json")
    
    // Create location manager
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self // Set owner to location manager is view controller
        self.mapView.delegate = self
        
        self.locationManager.startUpdatingLocation() // Update location to see if user moves etc.
        self.locationManager.requestWhenInUseAuthorization() // Ask user to grant authorization for us to get their data
        let data = NSData(contentsOfURL: endpoint!) // "!" means "unwrapping" something -> type has been lost because we're trying to use two different code bases together (think of you got a gift wrapped up, you THINK you know what it is b/c you've been hinting at it but you're not sure ... so you have to unwrap it to find out -> only don't have to do it if you're SURE you know what's inside)
        
        if let contentData = data {
            // print (data)
            if let json = try? NSJSONSerialization.JSONObjectWithData(contentData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                print(json)
                let station = Station(json: json!)
                for pins in station.mapPins {
                    print(pins)
                    mapView.addAnnotation((pins as? MapPin)!)
                }
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

