//
//  TVNetworkingManager.swift
//  TMDB
//
//  Created by 이상봉 on 2021/10/03.
//

import Foundation
import Moya
import ProgressHUD

class TApi {
    static let provider = MoyaProvider<TVApi>()
    
    static func getTV(source: TVApi, completion: @escaping ([TV]) -> ()) {
        
        ProgressHUD.colorAnimation = .orange
        ProgressHUD.colorHUD = .orange
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.show()
        
        provider.request(source) { (result) in
            switch result {
            case .success(let response):
                do {
                    let results = try
                    JSONDecoder().decode(TVResults.self, from: response.data)
                    
                    completion(results.tvs)
                    ProgressHUD.dismiss()
                } catch let err {
                    print(err)
                    ProgressHUD.dismiss()
                }
                break
                
            case .failure(let error):
                print(error)
                ProgressHUD.dismiss()
                break
            }
        }
    }
    
    static func getDetailTV(tvId: Int, completion: @escaping (TVDetail) -> ()) {
        
        ProgressHUD.show()
        
        provider.request(.detail(id: tvId)) { result in
            switch result {
            case .success(let response):
                do {
                    let results = try JSONDecoder().decode(TVDetail.self, from: response.data)
                    
                    completion(results)
                    ProgressHUD.dismiss()
                } catch let err{
                    print(err)
                    ProgressHUD.dismiss()
                }
                break
                
            case .failure(let error):
                print(error)
                ProgressHUD.dismiss()
                break
            }
        }
    }
    
    
}
