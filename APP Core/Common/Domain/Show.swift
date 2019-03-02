//
//  Show.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

public struct Show: Decodable {
    let identifier: Int64
    let title: String
    let posterPath: String?
    let backdropPath: String?
    let firstAirDate: Date?
    let genreIdentifiers: [Int]?
    
    public  enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title = "name"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIdentifiers = "genre_ids"
    }
}
