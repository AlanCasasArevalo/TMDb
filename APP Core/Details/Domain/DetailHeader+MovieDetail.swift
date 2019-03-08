//
//  DetailHeader+MovieDetail.swift
//  APP Core
//
//  Created by Alan Casas on 08/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(movie: MovieDetail, dateFormatter: DateFormatter) {
        title = movie.title
        posterPath = movie.posterPath
        backdropPath = movie.backdropPath
        
        let releaseDate = movie.releaseDate.flatMap { dateFormatter.date(from: $0)}
        let year = (releaseDate?.year).map { String($0) }
        let duration = "\(movie.runtime) min."
        
        metadata = [year, duration]
            .compactMap {
                $0
            }.joined(separator: " - ")
    }
}
