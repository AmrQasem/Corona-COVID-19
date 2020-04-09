//
//  NewsService.swift
//  Zagel Sports
//
//  Created by Clicks Egypt on 12/25/19.
//  Copyright © 2019 Clicks Egypt. All rights reserved.
//

import Moya

enum NewsService {
    
    case GetNewsHome (SourceID: Int,SectionID: Int, amount: Int, TimeStamp: Int64)
    case getArticle(NewsID: Int64)
    case getSections(amount: Int)
    case getSources(amount: Int)
    case GetNewsTopic(topicID: Int, amount: Int, TimeStamp: Int64)
}

// MARK: - TargetType Protocol Implementation
extension NewsService: TargetType {
    
    var baseURL: URL { return URL(string: K_API_URL + "News/")! }
    
    var path: String {
        switch self {
        case .GetNewsHome(let SourceID,let SectionID , let Take, let TimeStamp):
            return "GetNewsHome/4107/\(SourceID)/\(SectionID)/\(Take)/\(TimeStamp)"
        case .getArticle(let NewsID):
            return "Details/4107/\(NewsID)"
        case .getSections(let amount):
            return "GetAllSection/4107/\(amount)"
        case .getSources(let amount):
            return "GetAllSource/4107/\(amount)"
        case .GetNewsTopic(let topicID, let amount, let TimeStamp) :
            return "GetAllNewsSection/0/\(topicID)/\(amount)/\(TimeStamp)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .GetNewsHome, .getArticle, .getSections, .getSources, .GetNewsTopic:
            return .get
        }
    }
    
    
    var parameters: [String: Any]? {
        
        switch self {
        case .GetNewsHome, .getArticle, .getSections, .getSources, .GetNewsTopic:
            return nil
        }
    }
    
    var headers: [String: String]? {
        
        switch self {
        case .GetNewsHome, .getArticle, .getSections, .getSources, .GetNewsTopic:
            return ["Content-type": "application/json",
                    "DeviceToken": "2291BC24-06A0-4467-9E08-9FAAA0EA9411",
                    "AuthToken": "zTD6e3e9el",
                    "API_Version":     "V10"]
            }
        }
    
    
    var task: Task {
        switch self {
        case .GetNewsHome, .getArticle, .getSections, .getSources, .GetNewsTopic:
            return .requestPlain
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
}


