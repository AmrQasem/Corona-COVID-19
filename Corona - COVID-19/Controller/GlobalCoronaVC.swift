//
//  GlobalCoronaVC.swift
//  Corona - COVID-19
//
//  Created by Clicks Egypt on 4/9/20.
//  Copyright © 2020 Clicks Egypt. All rights reserved.
//

import UIKit
import Moya
import Moya_ModelMapper

class GlobalCoronaVC: UIViewController {
    
    var newConfirmed = 0
    var totalConfirmed = 0
    var newDeath = 0
    var totalDeath = 0
    var newRecovered = 0
    var totalRecovered = 0
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newConfirmedLabel: UILabel!
    @IBOutlet weak var totalConfirmedLabel: UILabel!
    @IBOutlet weak var newRecoveredLabel: UILabel!
    @IBOutlet weak var totalRecoveredLabel: UILabel!
    @IBOutlet weak var newDeathLabel: UILabel!
    @IBOutlet weak var totalDeathLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.getCoronaStats()
        
        let logo = UIImage(named: "coronavirus-covid-19-2019-coronavirus-disease-2AXDMAN")
        
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        
        self.newConfirmedLabel.text = "\(self.newConfirmed)"
        self.totalConfirmedLabel.text = "\(self.totalConfirmed)"
        self.newRecoveredLabel.text = "\(self.newRecovered)"
        self.totalRecoveredLabel.text = "\(self.totalRecovered)"
        self.newDeathLabel.text = "\(self.newDeath)"
        self.totalDeathLabel.text = "\(self.totalDeath)"
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        let result = formatter.string(from: date)
        self.dateLabel.text = result
        
        
    }
}


