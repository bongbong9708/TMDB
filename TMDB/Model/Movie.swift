//
//  Movie.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/29.
//

import Foundation

struct Movie: Codable {
    var id: Int = 0
    var backdrop: String = ""
    var language: String = ""
    var poster: String = ""
    var date: String = ""
    var title: String = ""
    var average: Double = 0.0
    
    enum MovieCodingKeys: String, CodingKey {
        case id
        case backdrop = "backdrop_path"
        case language = "original_language"
        case poster = "poster_path"
        case date = "release_date"
        case title
        case average = "vote_average"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MovieCodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        backdrop = try values.decode(String.self, forKey: .backdrop)
        language = try values.decode(String.self, forKey: .language)
        poster = try values.decode(String.self, forKey: .poster)
        date = try values.decode(String.self, forKey: .date)
        title = try values.decode(String.self, forKey: .title)
        average = try values.decode(Double.self, forKey: .average)
    }
}
