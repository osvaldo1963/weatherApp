//
//  currentWeather.swift
//  weather_App
//
//  Created by osvaldo lopez on 11/5/16.
//  Copyright © 2016 osvaldo lopez. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName : String!
    var _date : String!
    var _weatherType : String!
    var _currentTemp : Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date : String {
        if _date == nil  {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType : String {
        if _weatherType == nil  {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp : Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        if let url = currentWeatherURL {
            Alamofire.request(url).responseJSON { response in
                if let json = response.result.value {
                    print(json)
                }
            }
            completed()
        }
    }
    
}
