//
//  CoronaService.swift
//  Corona - COVID-19
//
//  Created by Clicks Egypt on 4/6/20.
//  Copyright © 2020 Clicks Egypt. All rights reserved.
//

import Moya

enum CoronaService {
    case getCoronaNumbers

}

// MARK: - TargetType Protocol Implementation
extension CoronaService: TargetType {
//    var path: String {
//        return ""
//    }
    
    
    public var baseURL: URL {
      return URL(string: "https://api.covid19api.com")!
    }
    var path: String {
        switch self {
        case .getCoronaNumbers:
            return "/summary"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCoronaNumbers:
            return .get
        }
    }
    
    
    var parameters: [String: Any]? {
        
        switch self {
        case .getCoronaNumbers:
            return nil
        }
    }
    
    var headers: [String: String]? {
        
        switch self {
        case .getCoronaNumbers:
            return nil
            }
        }
    
    
    var task: Task {
        switch self {
        case .getCoronaNumbers:
            return .requestPlain
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
}
