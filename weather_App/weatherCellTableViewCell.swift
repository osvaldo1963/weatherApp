//
//  weatherCellTableViewCell.swift
//  weather_App
//
//  Created by osvaldo lopez on 11/19/16.
//  Copyright © 2016 osvaldo lopez. All rights reserved.
//

import UIKit

class weatherCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var DayLabel: UILabel!
    @IBOutlet weak var WeatherType: UILabel!
    @IBOutlet weak var fareight: UILabel!
    @IBOutlet weak var celsious: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
