//
//  Endpoint.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

private enum HTTPMethod: String {
    case get = "GET"
}

internal enum Endpoint {
    case configuration
    case moviesNowPlaying(region: String, page: Int)
    case showsOnTheAir(page: Int)
    case searchResults(query: String, page: Int, includeAdult: Bool)
}

internal extension Endpoint {
    func request (with baseURL: URL, parameters: [String: String]) -> URLRequest{
        let url = baseURL.appendingPathComponent(path)
        var newParameters = self.parameters
        parameters.forEach {
            newParameters.updateValue($1, forKey: $0)
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = newParameters.map(URLQueryItem.init)
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        return request
    }
}

private extension Endpoint {
    var method: HTTPMethod{
        return .get
    }
    
    var path: String {
        switch self {
        case .configuration:
            return "configuration"
        case .moviesNowPlaying:
            return "movie/now_playing"
        case .showsOnTheAir:
            return "tv/on_the_air"
        case .searchResults:
            return "search/multi"
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .configuration:
            return [:]
        case .moviesNowPlaying(let region, let page):
            return [
                "region": region,
                "page": String(page)
            ]
        case .showsOnTheAir(let page):
            return [ "page": String(page) ]
        case .searchResults(let query, let page, let includeAdult):
            return [
                "query": query,
                "page" : String(page),
                "include_adult" : String(includeAdult)
            ]
        }
    }
    
}


