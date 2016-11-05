//
//  custans.swift
//  weather_App
//
//  Created by osvaldo lopez on 11/5/16.
//  Copyright © 2016 osvaldo lopez. All rights reserved.
//

import Foundation

let Base_URL = "http://api.openweathermap.org/data/2.5/weather?"
let latitude = "lat="
let longtitude = "&lon="
let app_id = "&appid="
let api_key = "d243475fbf2938bcc49073c7131adef2"
typealias DownloadComplete = () -> ()
let CURRENT_WEATHER_URL = "\(Base_URL)\(latitude)35\(longtitude)139\(app_id)\(api_key)"
