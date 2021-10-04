//
//  TV.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/29.
//

import Foundation

struct TV: Codable {
    var backdrop: String?
    var date: String = ""
    var id: Int = 0
    var name: String = ""
    var language: String = ""
    var poster: String = ""
    var average: Double = 0.0
    
    enum TVCodingKeys: String, CodingKey {
        case backdrop = "backdrop_path"
        case date = "first_air_date"
        case id
        case name
        case language = "original_language"
        case poster = "poster_path"
        case average = "vote_average"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: TVCodingKeys.self)
        
        backdrop = try values.decodeIfPresent(String.self, forKey: .backdrop)
        date = try values.decode(String.self, forKey: .date)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        language = try values.decode(String.self, forKey: .language)
        poster = try values.decode(String.self, forKey: .poster)
        average = try values.decode(Double.self, forKey: .average)
    }
}
