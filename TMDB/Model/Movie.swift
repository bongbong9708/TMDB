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
    var poster: String = ""
    var title: String = ""
    
    enum MovieCodingKeys: String, CodingKey {
        case id
        case backdrop = "backdrop_path"
        case poster = "poster_path"
        case title
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MovieCodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        backdrop = try values.decode(String.self, forKey: .backdrop)
        poster = try values.decode(String.self, forKey: .poster)
        title = try values.decode(String.self, forKey: .title)
    }
}
