//
//  ImageConfiguration.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

public struct ImageConfiguration: Decodable {
    public struct Images: Decodable {
        public let baseURL: URL
        
        private enum CodingKeys: String, CodingKey {
            case baseURL = "secure_base_url"
        }
    }
    
    public let images: Images
}

public extension ImageConfiguration {
    static let `default` = ImageConfiguration(images: Images(baseURL: URL(string: CONSTANTS.CALLS.BASE_IMAGE_URL)!))
}
