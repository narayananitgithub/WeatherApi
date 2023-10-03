//
//  WeatherTableViewCell.swift
//  WeatherApi
//
//  Created by Narayanasamy on 30/09/23.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    
      @IBOutlet weak var nameLabel: UILabel!
       @IBOutlet weak var idLabel: UILabel!
       @IBOutlet weak var codLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
