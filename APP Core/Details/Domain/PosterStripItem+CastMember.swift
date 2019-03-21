//
//  PosterStripItem+CastMember.swift
//  APP Core
//
//  Created by Alan Casas on 21/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

extension PosterStripItem {
    init(castMember: Credits.CastMember) {
        identifier = castMember.identifier
        mediaType = .person
        title = castMember.name
        metadata = castMember.character
        posterPath = castMember.profilePath
    }
}
