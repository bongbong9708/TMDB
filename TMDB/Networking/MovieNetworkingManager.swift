//
//  MovieNetworkingManager.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/30.
//

import Foundation
import Moya

class MApi {
    static let provider = MoyaProvider<MovieApi>()
    static func getMovie(source: MovieApi, completion: @escaping ([Movie]) -> ()) {
        
        provider.request(source) { (result) in
            switch result {
            case .success(let response):
                do {
                    let results = try JSONDecoder().decode(MovieResults.self, from: response.data)
                    
                    completion(results.movies)
                } catch let err {
                    print(err)
                }
                break
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    
}
