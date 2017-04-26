//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Radosław Stelmasiak on 17.04.2017.
//  Copyright © 2017 Radosław Stelmasiak. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
   
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var highTemp: UILabel!
    
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast){
        
        dayLabel.text = forecast.date
        weatherLabel.text = forecast.weatherType
        highTemp.text = "\(forecast.highTemp)"
        lowTemp.text = "\(forecast.lowTemp)"
        weatherIcon.image = UIImage(named: forecast.weatherType)
        
    }

    

}
