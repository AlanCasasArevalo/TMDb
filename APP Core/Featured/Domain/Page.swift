//
//  Page.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

public struct Page<Generic: Decodable>: Decodable {
    public let page: Int
    public let totalPages: Int
    public let totalResults: Int
    public let results: [Generic]
    
    public enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
    }
    
}
