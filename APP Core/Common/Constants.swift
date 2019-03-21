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
    let POSTER_STRIP_VIEW_CONSTANTS = PosterStripViewConstants()
    let POSTER_STRIP_LAYOUT_CONSTANTS = PosterStripLayoutConstans()
    let FEATURED_VIEW_LITERAL = FeaturedViewLiteral()
    let SEARCH_CONTROLLER_CONSTANTS = SearchControllerConstants()
    let FEATURED_PRESENTER_PREFIX_CONSTANTS = FeaturedPresenterPrefix()
    let MOVIEW_DETAIL_PRESENTER_STRINGS = MovieDetailPresenterStrings()
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

struct PosterStripViewConstants {
    let cgSizeHeight: CGFloat = 218
}

struct FeaturedViewLiteral {
    let FeatureTitle = "Featured"
    let FeatureShowHeader = "ON TV"
    let FeatureMovieHeader = "IN THEATERS"
}

struct MovieDetailPresenterStrings {
    let overviewTitle = "Overview"
    let castTitle = "Cast"
}

struct PosterStripLayoutConstans {
    let itemSize = CGSize(width: 96, height: 186)
    let minimumLineSpacing: CGFloat = 16
    let sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
}

struct SearchControllerConstants {
    let placeHolderTitle = "Search"
}


struct FeaturedPresenterPrefix {
    let moviesToShow = 10
    let showsToShow = 10
}

