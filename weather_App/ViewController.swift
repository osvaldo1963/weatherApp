//
//  ViewController.swift
//  weather_App
//
//  Created by osvaldo lopez on 11/2/16.
//  Copyright © 2016 osvaldo lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel   : UILabel!
    @IBOutlet weak var temperatur  : UILabel!
    @IBOutlet weak var location    : UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherType : UILabel!
    @IBOutlet weak var CustomTable : UITableView!
    
    let alamoreRequest = CurrentWeather()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.CustomTable.delegate = self
        self.CustomTable.dataSource = self
        self.CustomTable.rowHeight = 70
        self.alamoreRequest.downloadWeatherDetails { 
            result in
            print(result)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }
}

