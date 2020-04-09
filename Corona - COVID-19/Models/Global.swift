//
//  Global.swift
//  Corona - COVID-19
//
//  Created by Clicks Egypt on 4/9/20.
//  Copyright © 2020 Clicks Egypt. All rights reserved.
//

import Foundation

import Mapper

class Global: Mappable {
       
    var NewConfirmed: Int?
    var TotalConfirmed: Int?
    var NewDeaths: Int?
    var TotalDeaths: Int?
    var NewRecovered: Int?
    var TotalRecovered: Int?

       
    required init(map: Mapper) throws {
        
        NewConfirmed = try? map.from("NewConfirmed") ?? 0
        TotalConfirmed = try? map.from("TotalConfirmed") ?? 0
        NewDeaths = try? map.from("NewDeaths")  ?? 0
        TotalDeaths = try? map.from("TotalDeaths") ?? 0
        NewRecovered = try? map.from("NewRecovered") ?? 0
        TotalRecovered = try? map.from("TotalRecovered") ?? 0
        }
}
