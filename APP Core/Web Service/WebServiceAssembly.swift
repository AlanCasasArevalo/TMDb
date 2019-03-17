//
//  WebServiceAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final public class WebServiceAssembly {
    private (set) lazy var webService = WebService(configuration: .default)
    
    private(set) lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return formatter
    }()
}
