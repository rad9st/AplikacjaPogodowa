//
//  Forecast.swift
//  WeatherApp
//
//  Created by Radosław Stelmasiak on 12.04.2017.
//  Copyright © 2017 Radosław Stelmasiak. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String{
        if _highTemp == nil{
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String{
        if _lowTemp == nil{
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject>{
            
            if let min = temp["min"] as? Double{
                let currentTempKalvin = min
                let tempCelcius = currentTempKalvin - 273.15
                self._lowTemp = "\(tempCelcius.rounded())"            }
            
            if let max = temp["max"] as? Double{
                let currentTempKalvin = max
                let tempCelcius = currentTempKalvin - 273.15
                self._highTemp = "\(tempCelcius.rounded())"            }
            
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]{
            
            if let main = weather[0]["main"] as? String{
                 self._weatherType = main
            }
           
            
        }
        
        if let date = weatherDict["dt"] as? Double{
            let unixConvertedDate = Date(timeIntervalSince1970:  date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
            
        }
        
    }
    
}



extension Date{
    func dayOfTheWeek() -> String {
        let dataForrmatter = DateFormatter()
        dataForrmatter.dateFormat = "EEEE"
        return dataForrmatter.string(from: self)
    }
}



