//
//  Station.swift
//  BikeShareApp
//
//  Created by Elvina Tse on 2015-11-19.
//  Copyright © 2015 Elvina Tse. All rights reserved.
//

import Foundation
import MapKit

struct Station {
    var mapPins:NSMutableArray = []
    
    // http://www.bikesharetoronto.com/stations/json
    init(json:NSDictionary) {
        if let bikeShareStations = json["stationBeanList"] as? NSArray {
            let bikeShareDepots = bikeShareStations
            for var i = 0; i < bikeShareDepots.count; i++ {
                // Need to put types here because we don't initialize with a value (can't infer)
                var availableBike:Int? // "?" means optional, i.e. value can be nil
                var availableDocks:Int?
                var latitude:Float?
                var longitude:Float?
                var stationName:String?
                let bikeShareData = bikeShareDepots[i] as? NSDictionary // "Force" type, so if it's not already NSDictionary then make it one
                
                if let bikeShare = bikeShareData { // Being safe here by "if letting" -> will skip if something seems wrong
                    if let bike = bikeShare["availableBikes"] as? Int {
                        availableBike = bike as Int
                    }
                    /* Alternate guard let method below:
                    guard let bike = bikeShare["availableBikes"] as? Int else {
                        print("Problem happened!")
                        return
                    }
                    availableBike = bike */
                    
                    if let dock = bikeShare["availableDocks"] as? Int {
                        availableDocks = dock as Int
                    }
                    
                    if let lat = bikeShare["latitude"] as? Float {
                        latitude = lat as Float
                    }
                    
                    if let long = bikeShare["longitude"] as? Float {
                        longitude = long // "as Float" not needed (will do the same thing) but is "safer"
                    }
                    
                    if let station = bikeShare["stationName"] as? String {
                        stationName = station
                    }
                    
                    let pin = MapPin(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude!), longitude: CLLocationDegrees(longitude!)), title: stationName!, subtitle: "Hello")
                    mapPins.addObject(pin)
                }
            }
        }
    }
}