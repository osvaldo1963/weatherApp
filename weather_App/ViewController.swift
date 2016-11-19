//
//  ViewController.swift
//  weather_App
//
//  Created by osvaldo lopez on 11/2/16.
//  Copyright © 2016 osvaldo lopez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel   : UILabel!
    @IBOutlet weak var temperatur  : UILabel!
    @IBOutlet weak var location    : UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherType : UILabel!
    @IBOutlet weak var CustomTable : UITableView!
    
    var alamoreRequest : CurrentWeather!
    var Forcast        : forcast!
    var forscats = [forcast]()
    var FcType = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.CustomTable.delegate = self
        self.CustomTable.dataSource = self
        self.CustomTable.rowHeight = 70
        self.alamoreRequest = CurrentWeather()
        self.alamoreRequest.downloadWeatherDetails {
            self.weatherui()
        }
        self.donwloadForcastData()
        

    }
    
    func donwloadForcastData() {
        let forecastURL = URL(string: FORECAST_CAST)!
        Alamofire.request(forecastURL).responseJSON {
            response in
            let result = response.result
            guard let dict = result.value  as? Dictionary<String, AnyObject>, dict != nil else {
                return
            }
            guard let list = dict["list"] as? [Dictionary<String, AnyObject>], list != nil else {
                return
            }
            for weather in list {
                guard let content = weather["weather"] as? [Dictionary<String, AnyObject>], content != nil else {
                    return
                }
                guard let main = content[0]["main"] as? String, main != "" else {
                    return
                }
                
                self.FcType.append(main)
                
            }
            print(self.FcType)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.FcType.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        
        
        return cell
    }
    
    func weatherui() {
        self.dateLabel.text = self.alamoreRequest.date
        self.temperatur.text = "\(self.alamoreRequest.currentTemp)"
        self.location.text = self.alamoreRequest.cityName
        self.weatherType.text = self.alamoreRequest.weatherType
    }
    
}

