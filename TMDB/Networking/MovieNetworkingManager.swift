//
//  MovieNetworkingManager.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/30.
//

import Foundation
import Moya
import ProgressHUD

class MApi {
    static let provider = MoyaProvider<MovieApi>()
    
    static func getMovie(source: MovieApi, completion: @escaping ([Movie]) -> ()) {
        
        ProgressHUD.colorAnimation = .blue
        ProgressHUD.colorHUD = .blue
        ProgressHUD.animationType = .lineSpinFade
        ProgressHUD.show()
        
        provider.request(source) { (result) in
            switch result {
            case .success(let response):
                do {
                    let results = try JSONDecoder().decode(MovieResults.self, from: response.data)
                    
                    completion(results.movies)
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
    
    static func getDetailMovie(movieId: Int, completion: @escaping (MovieDetail) -> ()) {
     
        ProgressHUD.show()

        provider.request(.detail(id: movieId)) { result in
            switch result {
            case .success(let response):
                do {
                    let results = try JSONDecoder().decode(MovieDetail.self, from: response.data)
                    
                    completion(results)
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
    
    
}
