//
//  TVNetworkingManager.swift
//  TMDB
//
//  Created by 이상봉 on 2021/10/03.
//

import Foundation
import Moya

class TApi {
    static let provider = MoyaProvider<TVApi>()
    static func getTV(source: TVApi, completion: @escaping ([TV]) -> ()) {
        
        provider.request(source) { (result) in
            switch result {
            case .success(let response):
                do {
                    let results = try
                    JSONDecoder().decode(TVResults.self, from: response.data)
                    
                    completion(results.tvs)
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
