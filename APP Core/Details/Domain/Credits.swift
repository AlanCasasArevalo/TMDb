//
//  Credits.swift
//  APP Core
//
//  Created by Alan Casas on 08/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

public struct Credits: Decodable {
    struct CastMember: Decodable {
        let character: String
        let identifier: Int64
        let name: String
        let profilePath: String?
        
        public enum CodingKeys: String, CodingKey {
            case character
            case identifier = "id"
            case name
            case profilePath = "profile_path"
        }
    }
    
    let cast: [CastMember]
}
