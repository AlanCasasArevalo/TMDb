//
//  Movie.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

public struct Movie: Decodable {
    let identifier: Int64
    let title: String
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: Date?
    let genreIdentifiers: [Int]?
    
    public  enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case genreIdentifiers = "genre_ids"
    }
    public init(identifier: Int64, title: String,posterPath: String?, backdropPath: String?, releaseDate: Date?, genreIdentifiers: [Int]?){
        self.identifier = identifier
        self.title = title
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.releaseDate = releaseDate
        self.genreIdentifiers = genreIdentifiers
    }
}
