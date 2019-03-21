//
//  Cast.swift
//  APP Core
//
//  Created by Alan Casas on 21/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

struct Cast: Decodable {
    let id: Int
    let originalLanguage: String
    let episodeCount: Int?
    let overview: String
    let originCountry: [String]?
    let originalName: String?
    let genreids: [Int]
    let name: String?
    let mediaType: String
    let posterPath: String?
    let firstAirDate: String?
    let voteAverage: Double
    let voteCount: Int
    let character: String
    let backdropPath: String?
    let popularity: Double
    let creditid: String
    let originalTitle: String?
    let video: Bool?
    let releaseDate: String?
    let title: String?
    let adult: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case originalLanguage = "original_language"
        case episodeCount = "episode_count"
        case overview = "overview"
        case originCountry = "origin_country"
        case originalName = "original_name"
        case genreids = "genre_ids"
        case name = "name"
        case mediaType = "media_type"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case character = "character"
        case backdropPath = "backdrop_path"
        case popularity = "popularity"
        case creditid = "credit_id"
        case originalTitle = "original_title"
        case video = "video"
        case releaseDate = "release_date"
        case title = "title"
        case adult = "adult"
    }
}
