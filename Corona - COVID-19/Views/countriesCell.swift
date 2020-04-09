//
//  countriesCell.swift
//  Corona - COVID-19
//
//  Created by Clicks Egypt on 4/6/20.
//  Copyright © 2020 Clicks Egypt. All rights reserved.
//

import UIKit

class countriesCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        // Configure the view for the selected state
    }
    
}
