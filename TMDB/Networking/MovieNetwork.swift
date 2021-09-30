//
//  MovieNetwork.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/30.
//

import Foundation
import Moya

enum MovieApi {
    case popular
    case topRated
    case upcoming
}

extension MovieApi: TargetType {
    var baseURL: URL {
        guard let movieURL = URL(string: Constants.commonAddress + "movie/") else {
            fatalError("baseURL could not be configured.")
        }
        return movieURL
    }
    
    var path: String {
        switch self {
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .upcoming:
            return "upcoming"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .popular, .topRated, .upcoming:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .popular, .topRated, .upcoming:
            return .requestParameters(parameters: ["api_key" : Constants.tmdb_APIKey, "language" : "en-US"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    
}
