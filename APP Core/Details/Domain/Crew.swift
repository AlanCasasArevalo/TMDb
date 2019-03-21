//
//  Crew.swift
//  APP Core
//
//  Created by Alan Casas on 21/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation


struct Crew: Codable {
    let id: Int
    let department: String
    let originalLanguage: String
    let episodeCount: Int?
    let job: String
    let overview: String
    let originCountry: [String]?
    let originalName: String?
    let voteCount: Int
    let name: String?
    let mediaType: String
    let popularity: Double
    let creditid: String
    let backdropPath: String?
    let firstAirDate: String?
    let voteAverage: Double
    let genreids: [Int]
    let posterPath: String?
    let originalTitle: String?
    let video: Bool?
    let title: String?
    let adult: Bool?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case department = "department"
        case originalLanguage = "original_language"
        case episodeCount = "episode_count"
        case job = "job"
        case overview = "overview"
        case originCountry = "origin_country"
        case originalName = "original_name"
        case voteCount = "vote_count"
        case name = "name"
        case mediaType = "media_type"
        case popularity = "popularity"
        case creditid = "credit_id"
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case genreids = "genre_ids"
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case video = "video"
        case title = "title"
        case adult = "adult"
        case releaseDate = "release_date"
    }
}
