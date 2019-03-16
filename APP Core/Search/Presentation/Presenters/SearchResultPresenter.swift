//
//  SearchResultPresenter.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift
import RxCocoa

final class SearchResultCellPresenter {
    let imageRepositoryProtocol: ImageRepositoryProtocol
    let dateFormatter: DateFormatter
    
    init( imageRepositoryProtocol: ImageRepositoryProtocol, dateFormatter: DateFormatter){
        self.imageRepositoryProtocol = imageRepositoryProtocol
        self.dateFormatter = dateFormatter
    }
    
    func present(searchResult: SearchResult, cell: SearchResultCell) {
        switch searchResult {
        case let .movie(movie):
            present(movie: movie, in: cell)
        case let .show(show):
            present(show: show, in: cell)
        case let .person(person):
            present(person: person, cell: cell)
        }
    }
    
}

extension SearchResultCellPresenter {
    
    func present(movie: Movie, in cell: SearchResultCell) {
        presentImage(path: movie.posterPath, cell: cell)
        
        cell.headlineLabel.text = NSLocalizedString("MOVIE", comment: "")
        cell.titleLabel.text = movie.title
        
        // TODO: We should make a dateFormatter
        let releaseDate = movie.releaseDate.flatMap { date in
            dateFormatter.date(from: "\(date)")
        }
        
        let metadata = (releaseDate?.year).flatMap { year in
            String(year)
            } ?? ""
        
        cell.metaDataLabel.text = metadata
        cell.metaDataLabel.isHidden = metadata.isEmpty
        
    }
    func present(show: Show, in cell: SearchResultCell) {
        presentImage(path: show.posterPath, cell: cell)
        
        cell.headlineLabel.text = NSLocalizedString("SHOW", comment: "")
        cell.titleLabel.text = show.title
        
        // TODO: We should make a dateFormatter
        let firstAirDate = show.firstAirDate.flatMap { date in
            dateFormatter.date(from: "\(date)")
        }
        
        let metadata = (firstAirDate?.year).flatMap { year in
            String(year)
            } ?? ""
        
        cell.metaDataLabel.text = metadata
        cell.metaDataLabel.isHidden = metadata.isEmpty
        
    }

    func present(person: Person, cell: SearchResultCell) {
        presentImage(path: person.profilePath, cell: cell)
        
        cell.headlineLabel.text = NSLocalizedString("PERSON", comment: "")
        cell.titleLabel.text = person.name
        
        let metadata = person.knownFor?.first
            .flatMap { media -> (String, Date?) in
                switch media {
                case .movie(let movie):
                    let releaseDate = movie.releaseDate.flatMap({ date in
                        dateFormatter.date(from: "\(date)")
                    })
                    return (movie.title, releaseDate)
                case .show(let show):
                    let firstAirDate = show.firstAirDate.flatMap({ date in
                        dateFormatter.date(from: "\(date)")
                    })
                    return (show.title, firstAirDate)
                }
            }
            .map { title, date in
                if let year = date?.year {
                    return "\(title) (\(year))"
                }
                return title
            } ?? ""
        
        cell.metaDataLabel.text = metadata
        cell.metaDataLabel.isHidden = metadata.isEmpty
        
    }
    
    
    
    func presentImage(path: String?, cell: SearchResultCell)  {
        guard let path = path else { return }
        
        imageRepositoryProtocol.imageFromApi(path: path, size: .w154)
            .observeOn(MainScheduler.instance)
            .bind(to: cell.posterImageView.rx.image)
            .disposed(by: cell.disposeBag)
    }
    
}














