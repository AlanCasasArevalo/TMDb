//
//  Media.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

enum Media {
    case movie(Movie)
    case show(Show)
}

extension Media: Decodable {
    enum CodingKeys: String, CodingKey {
        case mediaType = "media_type"
    }
    
   init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let mediaType = try container.decode(String.self, forKey: .mediaType)
        
        switch mediaType {
        case "movie":
            self = try .movie(Movie(from: decoder))
        case "tv":
            self = try .show(Show(from: decoder))
        default:
            let context = DecodingError.Context(codingPath: [CodingKeys.mediaType],
                                                debugDescription: "Unknown media type: \(mediaType)")
            throw DecodingError.dataCorrupted(context)
        }
    }
}
