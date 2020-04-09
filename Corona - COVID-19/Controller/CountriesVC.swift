//
//  ViewController.swift
//  Corona - COVID-19
//
//  Created by Clicks Egypt on 4/6/20.
//  Copyright © 2020 Clicks Egypt. All rights reserved.
//

import UIKit
import Moya
import Moya_ModelMapper


class CountriesVC: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let provider = MoyaProvider<CoronaService>()
    
    var countriesArr = [String]()
    var countryName: String = ""
    var statsDic = [String: [Corona]]()
    var coronaArr = [Corona]()
    var currentCoronaArr = [Corona]()
    var coronaGlobalArr: Global!
    var countryCode = ""
    var newConfirmed = 0
    var totalConfirmed = 0
    var newDeath = 0
    var totalDeath = 0
    var newRecovered = 0
    var totalRecovered = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setupSearchBar()
        self.getCoronaStats()
        self.getCoronaStatsGlobal()

        tableView.register(UINib.init(nibName: "countriesCell", bundle: nil), forCellReuseIdentifier: "countriesCell")
        
        let logo = UIImage(named: "coronavirus-covid-19-2019-coronavirus-disease-2AXDMAN")
        
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Global", style: .plain, target: self, action: #selector(self.globalPressed))
        // Do any additional setup after loading the view.
    }

 
        

    @objc func globalPressed(sender: UIBarButtonItem) {

        self.performSegue(withIdentifier: "globalSegue", sender: self)
    }
    func getCoronaStats (){
        
        provider.request(.getCoronaNumbers) { (result) in
              
              switch result {

              case .success(let response):
                  if response.statusCode == 200 {

                      do {
                        self.coronaArr = try response.map(to: [Corona].self, keyPath: "Countries")

//                          if self.coronaArr.count > 0{
//                              for n in self.coronaArr {
//                                  self.coronaArr.append(n)
//                              }
                            self.currentCoronaArr = self.coronaArr
                            print("Coronaaaa\(self.coronaArr)")
//                          }
                          DispatchQueue.main.async {
                              self.tableView.reloadData()
                          }
                      }
                      catch let myError{
                          
                          print("bazet\(myError)")
                      }
                  } else {
                      if let responseDic = try? response.mapJSON() as? [String: Any]{
                          let message = responseDic["Message"] as? String
                          print(message as Any)
                      }else{
                          
                          print("error")
                      }
                  }
                  
              case .failure:
                  print("error")
              }
          }
      }
    
     func getCoronaStatsGlobal (){
            
            provider.request(.getCoronaNumbers) { (result) in
                
                switch result {
                    
                case .success(let response):
                    if response.statusCode == 200 {
                        
                        do {
                            let x = try response.map(to: Global.self, keyPath: "Global")
                            self.coronaGlobalArr = x
//                            self.coronaGlobalArr = x
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                        catch {
                            
                            print("error")
                        }
                    } else {
                        if let responseDic = try? response.mapJSON() as? [String: Any]{
                            let message = responseDic["Message"] as? String
                            print(message as Any)
                        }else{
                            
                            print("error")
                        }
                    }
                    
                case .failure:
                    print("error")
                }
            }
        }
      

//
//    private func setupSearchBar(){
//        searchBar.delegate = self
//    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        if !searchText.isEmpty {
            self.currentCoronaArr = self.coronaArr.filter({ (corona) -> Bool in
                (corona.Country!.contains(searchText))
            })
            self.tableView.reloadData()
        }
        else {
            currentCoronaArr = coronaArr
            tableView.reloadData()
            return
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCoronaArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countriesCell") as! countriesCell
        cell.countryName.text = " \(self.currentCoronaArr[indexPath.row].Country!)"
        
        cell.gotToCountry = { [weak self] in
            
            self?.countryCode = self?.currentCoronaArr[indexPath.row].CountryCode ?? ""
            self?.countryName = self?.currentCoronaArr[indexPath.row].Country ?? ""
            self?.newConfirmed = self?.currentCoronaArr[indexPath.row].NewConfirmed ?? 0
            self?.totalConfirmed = self?.currentCoronaArr[indexPath.row].TotalConfirmed ?? 0
            self?.totalDeath = self?.currentCoronaArr[indexPath.row].TotalDeaths ?? 0
            self?.newDeath = self?.currentCoronaArr[indexPath.row].NewDeaths ?? 0
            self?.totalRecovered = self?.currentCoronaArr[indexPath.row].TotalRecovered ?? 0
            self?.newRecovered = self?.currentCoronaArr[indexPath.row].NewRecovered ?? 0

//            print("xxx\(self?.countryCode)")
            self?.performSegue(withIdentifier: "countrySegue" , sender: nil)
            
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countrySegue" {
            var vc = segue.destination as! CoronaStatVC
            vc.newConfirmedNum = self.newConfirmed
            vc.totalConfirmedNum = self.totalConfirmed
            vc.newRecoveredNum = self.newRecovered
            vc.totalRecoveredNum = self.totalRecovered
            vc.newDeathNum = self.newDeath
            vc.totalDeathNum = self.totalDeath
            vc.countryName = self.countryName
        }
        else if segue.identifier == "globalSegue" {
            var vc = segue.destination as! GlobalCoronaVC
            vc.newConfirmed = self.coronaGlobalArr.NewConfirmed ?? 0
            vc.totalConfirmed = self.coronaGlobalArr.TotalConfirmed ?? 0
            vc.newRecovered = self.coronaGlobalArr.NewRecovered ?? 0
            vc.totalRecovered = self.coronaGlobalArr.TotalRecovered ?? 0
            vc.newDeath = self.coronaGlobalArr.NewDeaths ?? 0
            vc.totalDeath = self.coronaGlobalArr.TotalDeaths ?? 0
        }
    }
}

