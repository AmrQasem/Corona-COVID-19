//
//  Corona.swift
//  Corona - COVID-19
//
//  Created by Clicks Egypt on 4/6/20.
//  Copyright © 2020 Clicks Egypt. All rights reserved.
//

import Foundation
import Mapper

class Corona: Mappable {
       
       var Country: String?
       var CountryCode: String?
       var Slug: String?
       var NewConfirmed: Int?
       var TotalConfirmed: Int?
       var NewDeaths: Int?
       var TotalDeaths: Int?
       var NewRecovered: Int?
       var TotalRecovered: Int?
       var Date: String?
       
       required init(map: Mapper) throws {
           Country = try? map.from("Country") ?? ""
           CountryCode = try? map.from("CountryCode") ?? ""
           Slug = try? map.from("Slug") ?? ""
           NewConfirmed = try? map.from("NewConfirmed") ?? 0
           NewConfirmed = try? map.from("NewConfirmed") ?? 0
           NewDeaths = try? map.from("NewDeaths")  ?? 0
           TotalDeaths = try? map.from("TotalDeaths") ?? 0
           NewRecovered = try? map.from("NewRecovered") ?? 0
           TotalRecovered = try? map.from("TotalRecovered") ?? 0
           Date = try? map.from("Date")  ?? ""
           
           
       }
}
