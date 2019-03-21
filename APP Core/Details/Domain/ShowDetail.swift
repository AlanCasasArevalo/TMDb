//
//  ShowDetail.swift
//  APP Core
//
//  Created by Alan Casas on 21/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

struct ShowDetail: Decodable {
    let name: String
    let firstAirDate: String?
    let backdropPath: String?
    let identifier: Int64
    let overview: String?
    let posterPath: String?
    let episodeRunTime: [Int]?
    let credits: Credits?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case firstAirDate = "first_air_date"
        case backdropPath = "backdrop_path"
        case identifier = "id"
        case overview = "overview"
        case posterPath = "poster_path"
        case episodeRunTime = "episode_run_time"
        case credits
    }
}
