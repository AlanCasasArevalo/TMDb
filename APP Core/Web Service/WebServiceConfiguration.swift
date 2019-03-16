//
//  WebServiceConfiguration.swift
//  APP Core
//
//  Created by Alan Casas on 28/02/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

struct WebServiceConfiguration {
    
    let language: String
    let apiKey: String
    
    class Dummy {}
    
    static let `default` =
        WebServiceConfiguration(language: Bundle.main.preferredLocalizations[0],
                                apiKey: Bundle(for: WebServiceConfiguration.Dummy.self) .infoDictionary?["TMDB_API_KEY"] as? String ?? "")
    
    var parameters: [String : String] {
        return [
            "api_key" : apiKey,
            "language" : language
        ]
    }
}


