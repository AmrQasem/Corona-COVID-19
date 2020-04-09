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
    var statsDic = [String: [Corona]]()
    var coronaArr = [Corona]()
    var currentCoronaArr = [Corona]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchBar()
        self.getCoronaStats()
        tableView.register(UINib.init(nibName: "countriesCell", bundle: nil), forCellReuseIdentifier: "countriesCell")
        // Do any additional setup after loading the view.
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
      

    
    private func setupSearchBar(){
        searchBar.delegate = self
    }
    
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

        return cell
    }
}

