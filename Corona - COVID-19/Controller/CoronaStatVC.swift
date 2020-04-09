//
//  CoronaStatVC.swift
//  Corona - COVID-19
//
//  Created by Clicks Egypt on 4/9/20.
//  Copyright © 2020 Clicks Egypt. All rights reserved.
//

import UIKit

class CoronaStatVC: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var newConfirmedLabel: UILabel!
    @IBOutlet weak var totalConfirmedLabel: UILabel!
    @IBOutlet weak var newRecoverdLabel: UILabel!
    @IBOutlet weak var totalRecoverdLabel: UILabel!
    @IBOutlet weak var newDeathLabel: UILabel!
    @IBOutlet weak var totalDeathLabel: UILabel!

    
    var newConfirmedNum = 0
    var totalConfirmedNum = 0
    var newDeathNum = 0
    var totalDeathNum = 0
    var newRecoveredNum = 0
    var totalRecoveredNum = 0
    var countryName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "coronavirus-covid-19-2019-coronavirus-disease-2AXDMAN")

        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        let result = formatter.string(from: date)
        self.dateLabel.text = result
        self.newConfirmedLabel.text = String(newConfirmedNum)
        self.totalConfirmedLabel.text = String(totalConfirmedNum)
        self.newRecoverdLabel.text = String(newRecoveredNum)
        self.totalRecoverdLabel.text = String(totalRecoveredNum)
        self.newDeathLabel.text = String(newDeathNum)
        self.totalDeathLabel.text = String(totalDeathNum)
        self.countryLabel.text = "\(self.countryName)" + " Statisitcs"
        
        
        
        
//        self.confirmed.text = String(totalRecoveredNum)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
