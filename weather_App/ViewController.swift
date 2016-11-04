//
//  ViewController.swift
//  weather_App
//
//  Created by osvaldo lopez on 11/2/16.
//  Copyright © 2016 osvaldo lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var dateLabel   : UILabel!
    @IBOutlet weak var temperatur  : UILabel!
    @IBOutlet weak var location    : UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherType : UILabel!
    @IBOutlet weak var CustomTable : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

