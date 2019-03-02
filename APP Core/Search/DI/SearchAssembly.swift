//
//  SearchAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final public class SearchAssembly {
    
    public let imageLoadingAssembly: ImageLoadingAssembly
    
    public init(imageLoadingAssembly: ImageLoadingAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
    }
    
    public func searchResultCellPresenter() -> SearchResultCellPresenter{
        return SearchResultCellPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository, dateFormatter: DateFormatter())
    }

    public func presenter() -> SearchResultsPresenter{
        return SearchResultsPresenter()
    }
    
    public func searchResultsViewController() -> SearchResultsViewController{
        return SearchResultsViewController(presenter: presenter(), resultCellPresenter: searchResultCellPresenter())
    }
}
