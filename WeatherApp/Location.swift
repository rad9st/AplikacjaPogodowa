//
//  Location.swift
//  WeatherApp
//
//  Created by Radosław Stelmasiak on 17.04.2017.
//  Copyright © 2017 Radosław Stelmasiak. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init(){
        
    }
    
    var latitude: Double!
    var longitude: Double!
    
}
