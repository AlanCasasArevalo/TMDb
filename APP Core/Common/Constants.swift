//
//  Constants.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation


let CONSTANTS = Constants()
//let defaults = UserDefaults(suiteName: "group.orange.everis.sp.miorange")


struct Constants {
    let CALLS = BaseUrls()
    let TABLE_VIEW_CONSTANTS = TableViewConstants()
    let CARD_VIEW_CONSTANTS = CardViewConstants()
}

struct BaseUrls {
    let BASE_URL = "https://api.themoviedb.org/3"
    let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/"
}

struct TableViewConstants {
    let separatorInset = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 0)
    let rowHeight: CGFloat = 88
}

struct CardViewConstants {
    let cgSizeHeight: CGFloat = 176
}
