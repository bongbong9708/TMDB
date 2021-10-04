//
//  TVNetwork.swift
//  TMDB
//
//  Created by 이상봉 on 2021/10/03.
//

import Foundation
import Moya

enum TVApi{
    case popular
    case topRated
    case onTheAir
    case detail(id: Int)
}

extension TVApi: TargetType{
    var baseURL: URL {
        guard let tvURL = URL(string: Constants.commonAddress + "tv/") else {
            fatalError("baseURL could not be configureed.")
        }
        return tvURL
    }
    
    var path: String {
        switch self {
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .detail(id: let id):
            return "\(id)"
        case .onTheAir:
            return "on_the_air"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .popular, .topRated, .onTheAir, .detail(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .popular, .topRated, .onTheAir, .detail(_):
            return .requestParameters(parameters: ["api_key" : Constants.tmdb_APIKey, "language" : " en-US"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    
}
