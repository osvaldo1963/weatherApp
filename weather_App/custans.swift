//
//  custans.swift
//  weather_App
//
//  Created by osvaldo lopez on 11/5/16.
//  Copyright © 2016 osvaldo lopez. All rights reserved.
//

import Foundation

//let Base_URL = "http://api.openweathermap.org/data/2.5/weather?"
//let latitude = "lat="
//let longtitude = "&lon="
//let app_id = "&appid="
//let api_key = "d243475fbf2938bcc49073c7131adef2"
typealias DownloadComplete = () -> ()
typealias finsh = (_ data: [String]?) -> ()
//let CURRENT_WEATHER_URL = "\(Base_URL)\(latitude)35\(longtitude)139\(app_id)\(api_key)"
//let FORECAST_CAST = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&mode=json&appid=\(api_key)"

struct constans {
    private let Base_URL = "http://api.openweathermap.org/data/2.5/weather?"
    private let latitude = "lat="
    private let longtitude = "&lon="
    private let app_id = "&appid="
    private let api_key = "d243475fbf2938bcc49073c7131adef2"
    
    var current_weather_url : String {
        let CURRENT_WEATHER_URL = "\(Base_URL)\(latitude)35\(longtitude)139\(app_id)\(api_key)"
        return CURRENT_WEATHER_URL
    }
    var forecast_url : String  {
        let FORECAST_CAST = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&mode=json&appid=\(api_key)"
        return FORECAST_CAST
    }
}

