//
//  DetailHeader+ShowDetail.swift
//  APP Core
//
//  Created by Alan Casas on 21/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(showDetail: ShowDetail, dateFormatter: DateFormatter) {
        title = showDetail.name
        posterPath = showDetail.posterPath
        backdropPath = showDetail.backdropPath
        let firstAirDate = showDetail.firstAirDate.flatMap { dateFormatter.date(from: $0)}
        let year = (firstAirDate?.year).map { String($0) }
        let duration = "\(showDetail.episodeRunTime![0]) min."
        
        metadata = [year, duration]
            .compactMap {
                $0
            }.joined(separator: " - ")
    }
}
