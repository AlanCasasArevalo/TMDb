//
//  CardPresenter.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public class CardPresenter {
    
    public let imageRepositoryProtocol: ImageRepositoryProtocol
    public let dateFormatter: DateFormatter
    
    public init(imageRepositoryProtocol: ImageRepositoryProtocol, dateFormatter: DateFormatter ){
        self.imageRepositoryProtocol = imageRepositoryProtocol
        self.dateFormatter = dateFormatter
    }
    
    
    func presentMovie(movie: Movie, cardView: CardView)  {
        bindBackdrop(path: movie.backdropPath, cardView: cardView)
        
        cardView.titleLabel.text = movie.title.uppercased()
        let genre = movie.genreIdentifiers?.first.flatMap(Genre.name)
        
        // TODO: We should put correctly date
        let releaseDate = movie.releaseDate.flatMap { date  in
            dateFormatter.date(from: "\(date)")
        }
        
        let year = (releaseDate?.year).flatMap { year  in
            String(year)
        }
        
        cardView.metadataLabel.text = [year, genre].compactMap { $0 }.joined(separator: " ⋅ ")
        
    }
    
    func presentShow( show: Show, cardView: CardView){
        bindBackdrop(path: show.backdropPath, cardView: cardView)
        
        cardView.titleLabel.text = show.title.uppercased()
        let genre = show.genreIdentifiers?.first.flatMap(Genre.name)
        
        let firstAirDate = show.firstAirDate.flatMap { date in
            dateFormatter.date(from: "\(date)")
        }
        
        let year = (firstAirDate?.year).flatMap { year in
            String(year)
        }
        
        cardView.metadataLabel.text = [year, genre].compactMap { $0 }.joined(separator: " ⋅ ")

    }
}

extension CardPresenter {
    func bindBackdrop(path: String?, cardView: CardView) {
        guard let path = path else { return }
        
        imageRepositoryProtocol.imageFromApi(path: path, size: .w780)
            .observeOn(MainScheduler.instance)
            .bind(to: cardView.backdropImageView.rx.image)
            .disposed(by: cardView.disposeBag)
        
    }
}










































