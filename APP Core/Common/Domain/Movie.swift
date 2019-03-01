//
//  Movie.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let identifier: Int64
    let title: String
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: Date?
    let genreIdentifiers: [Int]?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case genreIdentifiers = "genre_ids"
    }
}
