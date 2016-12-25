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
    
    private var alamoreRequest : CurrentWeather!
    private var Forcast        : forcast!
    private var forscats = [forcast]()
    private var FcType = [""]
    private var http : httpRequest!
    private var finalData  = [""]
    private let constant = constans()

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

    }
    
    func donwloadForcastData(finish: @escaping finsh) {
        self.FcType.removeAll(keepingCapacity: false)
        let forecastURL = URL(string: self.constant.forecast_url)!
        Alamofire.request(forecastURL).responseJSON {
            response in
            let result = response.result
            guard let dict = result.value  as? Dictionary<String, AnyObject>, dict != nil else {
                return
            }
            guard let list = dict["list"] as? [Dictionary<String, AnyObject>], list != nil else {
                return
            }
            
            for list in list {
                let forecast = forcast(weatherDict: list)
                self.forscats.append(forecast)
            }
            finish(self.FcType)
        }
    
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.FcType.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! weatherCellTableViewCell
        
        cell.DayLabel.text = "jus  a test"
        
        
        return cell
    }
    
    func weatherui() {
        self.dateLabel.text = self.alamoreRequest.date
        self.temperatur.text = "\(self.alamoreRequest.currentTemp)"
        self.location.text = self.alamoreRequest.cityName
        self.weatherType.text = self.alamoreRequest.weatherType
    }
    
}

