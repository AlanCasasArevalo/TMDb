//
//  Genre.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation


public struct Genre: Decodable {
    public let identifier: Int
    public let name: String
    
    public  enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
    }
}

extension Genre {
    public static func name(forIdentifier identifier: Int) -> String? {
        return Genre.bundled[identifier]?.name
    }
    
    public static func names(forIdentifiers identifiers: [Int]) -> [String] {
        return identifiers.compactMap { Genre.bundled[$0]?.name }
    }
}

public  extension Genre {
    public static var bundled: [Int: Genre] = {
        class Dummy {}
        
        let bundle = Bundle(for: Dummy.self)
        let decoder = JSONDecoder()
        
        guard
            let url = bundle.url(forResource: "genres", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let genres = try? decoder.decode([Genre].self, from: data) else {
                fatalError("Couldn't load bundled genres")
        }
        
        var genresByIdentifier: [Int: Genre] = Dictionary(minimumCapacity: genres.count)
        
        for genre in genres {
            genresByIdentifier.updateValue(genre, forKey: genre.identifier)
        }
        
        return genresByIdentifier
    }()
}
