//
//  TVResult.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/29.
//

import Foundation

struct TVResults: Codable {
    var page: Int = 0
    var total_pages: Int = 0
    var total_results: Int = 0
    var tvs: [TV]
    
    enum TVResultsCodingKeys: String, CodingKey {
        case page
        case total_pages
        case total_results
        case tvs = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: TVResultsCodingKeys.self)
        
        page = try values.decode(Int.self, forKey: .page)
        total_pages = try values.decode(Int.self, forKey: .total_pages)
        total_results = try values.decode(Int.self, forKey: .total_results)
        tvs = try values.decode([TV].self, forKey: .tvs)
    }
}
