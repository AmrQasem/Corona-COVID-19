//
//  Stats.swift
//  Corona - COVID-19
//
//  Created by Clicks Egypt on 4/6/20.
//  Copyright © 2020 Clicks Egypt. All rights reserved.
//

import Foundation
import Mapper

class Stats: Mappable {
    
    var City: String?
    var province: String?
    var country : String?
    var lastUpdate : String?
    var keyId : String?
    var confirmed : Int?
    var deaths : Int?
    var recovered : Int?
    
    
    required init(map: Mapper) throws {
        City = try? map.from("city") ?? ""
        province = try? map.from("province") ?? ""
        country = try? map.from("country") ?? ""
        lastUpdate = try? map.from("lastUpdate") ?? ""
        keyId = try? map.from("keyId") ?? ""
        confirmed = try? map.from("confirmed") ?? 0
        deaths = try? map.from("deaths") ?? 0
        recovered = try? map.from("recovered") ?? 0

    }
}
