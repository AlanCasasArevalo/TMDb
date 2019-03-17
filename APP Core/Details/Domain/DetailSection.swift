//
//  DetailSection.swift
//  APP Core
//
//  Created by Alan Casas on 08/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

enum DetailSection {
    case header(DetailHeader)
    case about(title: String, detail: String)
    case posterStrip(title: String, items: [PosterStripItem])
}

