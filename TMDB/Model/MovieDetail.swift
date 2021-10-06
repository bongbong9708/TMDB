//
//  MovieDetail.swift
//  TMDB
//
//  Created by 이상봉 on 2021/10/06.
//

import Foundation

struct MovieDetail: Codable {
    var title: String = ""
    var backdrop: String = ""
    var homepage: String = ""
    var id: Int = 0
    var overview: String = ""
    var poster: String = ""
    var date: String = ""
    var runtime: Int = 0
    var status: String = ""
    var voteAvg: Double = 0.0
    
    enum MovieDetailCodingKeys: String, CodingKey {
        case title
        case backdrop = "backdrop_path"
        case homepage
        case id
        case overview
        case poster = "poster_path"
        case date = "release_date"
        case runtime
        case status
        case voteAvg = "vote_average"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MovieDetailCodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        backdrop = try values.decode(String.self, forKey: .backdrop)
        homepage = try values.decode(String.self, forKey: .homepage)
        id = try values.decode(Int.self, forKey: .id)
        overview = try values.decode(String.self, forKey: .overview)
        poster = try values.decode(String.self, forKey: .poster)
        date = try values.decode(String.self, forKey: .date)
        runtime = try values.decode(Int.self, forKey: .runtime)
        status = try values.decode(String.self, forKey: .status)
        voteAvg = try values.decode(Double.self, forKey: .voteAvg)
    }
}
