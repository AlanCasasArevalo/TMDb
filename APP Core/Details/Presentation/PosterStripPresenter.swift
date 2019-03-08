//
//  PosterStripPresenter.swift
//  APP Core
//
//  Created by Alan Casas on 04/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift
import RxCocoa

final public class PosterStripPresenter {
    public let imageRepositoryProtocol: ImageRepositoryProtocol
    
    public init (imageRepositoryProtocol: ImageRepositoryProtocol) {
        self.imageRepositoryProtocol = imageRepositoryProtocol
    }
    
    public func present(item:PosterStripItem,  cell: PosterStripCollectionCell){
        
        bindPoster(path: item.posterPath, cell: cell)
        
        cell.posterStripTitleLabel.text = item.title
        cell.posterStripMetadataLabel.text = item.metadata
    }
    
}

extension PosterStripPresenter {
    func bindPoster (path: String?, cell: PosterStripCollectionCell){
        guard let path = path else { return }
        
        imageRepositoryProtocol.imageFromApi(path: path, size: .w300)
            .observeOn(MainScheduler.instance)
            .bind(to: cell.posterImageView.rx.image)
            .disposed(by: cell.disposeBag)
        
    }
}


