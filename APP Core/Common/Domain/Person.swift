//
//  Person.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

struct Person: Decodable {
    let identifier: Int64
    let name: String
    let profilePath: String?
    let knownFor: [Media]?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}
