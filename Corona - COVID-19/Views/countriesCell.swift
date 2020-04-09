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
    var gotToCountry: (()-> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let gotToCountry = UITapGestureRecognizer(target: self, action: #selector(self.gotToCountry(_:)))
        countryName.addGestureRecognizer(gotToCountry)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        // Configure the view for the selected state
    }
    
    @objc func gotToCountry(_ sender:AnyObject){
        gotToCountry?()
    }
    
}
