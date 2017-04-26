//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Radosław Stelmasiak on 14.03.2017.
//  Copyright © 2017 Radosław Stelmasiak. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWeather {
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName:String{
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp:Double{
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var date: String{
        if _date == nil{
            _date = ""
        }
        
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .long
        dateFormater.timeStyle = .none
        let currentDate = dateFormater.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        let currentWeatherUrl = MakeAcctualWeatherUrl(lat: Location.sharedInstance.latitude, lon: Location.sharedInstance.longitude)
        // alamofire download
        Alamofire.request(currentWeatherUrl).responseJSON{
            response in
            let result  = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    if let currentTempKalvin = main["temp"] as? Double {
                        
                        let tempCelcius = currentTempKalvin - 273.15
                        self._currentTemp = tempCelcius.rounded()
                        print(self._currentTemp)
                        
                        
                    }
                }
                
                
            }
            completed()
            
        }
    }
    
}
