//
//  Constants.swift
//  WeatherApp
//
//  Created by Radosław Stelmasiak on 14.03.2017.
//  Copyright © 2017 Radosław Stelmasiak. All rights reserved.
//

import Foundation

// values used to create actual URL forecast
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LAT = "lat="
let LON = "&lon="
let APPID = "&appid="
let API_KEY = "2a1d9da4a923813852860fa3d6f3320d"

// values used to create 16 day forecast URL

let BASE_URL_16 = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let CNT = "&cnt=16"


typealias DownloadComplete = () -> ()

func MakeAcctualWeatherUrl(lat:Double, lon:Double) -> String{
    
    let newUrl = "\(BASE_URL)\(LAT)\(lat)\(LON)\(lon)\(APPID)\(API_KEY)"
    return newUrl
}

func Make16DaysForecast(lat:Double, lon:Double) -> String{
    let newURL = "\(BASE_URL_16)\(LAT)\(lat)\(LON)\(lon)\(CNT)\(APPID)\(API_KEY)"
    return newURL
}



