//
//  PersonDetail.swift
//  APP Core
//
//  Created by Alan Casas on 21/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
    let birthday: String?
    let knownForDepartment: String?
    let deathday: String?
    let identifier: Int64?
    let name: String?
    let alsoKnownAs: [String]?
    let biography: String?
    let profilePath: String?
    let homepage: String?
    let credits: Credits?
    
    enum CodingKeys: String, CodingKey {
        case birthday = "birthday"
        case knownForDepartment = "known_for_department"
        case deathday = "deathday"
        case identifier = "id"
        case name = "name"
        case alsoKnownAs = "also_known_as"
        case biography = "biography"
        case profilePath = "profile_path"
        case homepage = "homepage"
        case credits
    }
}

