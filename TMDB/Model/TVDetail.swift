//
//  TVDetail.swift
//  TMDB
//
//  Created by 이상봉 on 2021/10/04.
//

import Foundation

struct TVDetail: Codable {
    var backdrop: String = ""
    var id: Int = 0
//    var date: String = ""
    
    
    
    enum TVDetailCodingKeys: String, CodingKey {
        case backdrop = "backdrop_path"
        case id
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: TVDetailCodingKeys.self)
        
        backdrop = try values.decode(String.self, forKey: .backdrop)
        id = try values.decode(Int.self, forKey: .id)
    }
}
