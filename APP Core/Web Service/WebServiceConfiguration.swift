//
//  WebServiceConfiguration.swift
//  APP Core
//
//  Created by Alan Casas on 28/02/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

public struct WebServiceConfiguration {
    
    public let language: String
    public let apiKey: String
    
    public class Dummy {}
    
    public static let `default` =
        WebServiceConfiguration(language: Bundle.main.preferredLocalizations[0],
                                apiKey: Bundle(for: WebServiceConfiguration.Dummy.self) .infoDictionary?["TMDB_API_KEY"] as? String ?? "")
    
    var parameters: [String : String] {
        return [
            "api_key" : apiKey,
            "language" : language
        ]
    }
}


