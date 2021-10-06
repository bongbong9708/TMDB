//
//  TVDetail.swift
//  TMDB
//
//  Created by 이상봉 on 2021/10/04.
//

import Foundation

struct TVDetail: Codable {
    var name: String = ""
    var backdrop: String?
    var firstDate: String = ""
    var overview: String = ""
    var voteAvg: Double = 0.0
    var id: Int = 0
    var homepage: String = ""
    var status: String = ""
    
    enum TVDetailCodingKeys: String, CodingKey {
        case name
        case backdrop = "backdrop_path"
        case firstDate = "first_air_date"
        case overview
        case voteAvg = "vote_average"
        case id
        case homepage
        case status
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: TVDetailCodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        backdrop = try values.decodeIfPresent(String.self, forKey: .backdrop)
        firstDate = try values.decode(String.self, forKey: .firstDate)
        overview = try values.decode(String.self, forKey: .overview)
        voteAvg = try values.decode(Double.self, forKey: .voteAvg)
        id = try values.decode(Int.self, forKey: .id)
        homepage = try values.decode(String.self, forKey: .homepage)
        status = try values.decode(String.self, forKey: .status)
    }
}
