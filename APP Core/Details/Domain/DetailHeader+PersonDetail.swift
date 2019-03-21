//
//  DetailHeader+PersonDetail.swift
//  APP Core
//
//  Created by Alan Casas on 21/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(personDetail: PersonDetail, dateFormatter: DateFormatter) {
        title = personDetail.name!
        
        // FIXME: We should repair back drop image
        posterPath = personDetail.profilePath
        backdropPath = personDetail.profilePath
        
        let birthday = personDetail.birthday.flatMap { dateFormatter.date(from: $0)}
        let year = (birthday?.year).map { String($0) }
        let deathday = personDetail.deathday
        
        metadata = [year, deathday]
            .compactMap {
                $0
            }.joined(separator: " - ")
    }
    
}
