//
//  Endpoint.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
}

public enum Endpoint {
    case configuration
}

public extension Endpoint {
    func request (baseURL: URL, parameters: [String: String]) -> URLRequest{
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

public extension Endpoint {
    var method: HTTPMethod{
        return .get
    }
    
    var path: String {
        switch self {
        case .configuration:
            return "configuration"
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .configuration:
            return [:]
        }
    }
    
}


