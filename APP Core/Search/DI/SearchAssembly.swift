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
    public let detailAssembly: DetailsAssembly
    
    public init(imageLoadingAssembly: ImageLoadingAssembly, detailAssembly: DetailsAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly = detailAssembly
    }
    
    public func searchResultCellPresenter() -> SearchResultCellPresenter{
        return SearchResultCellPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository, dateFormatter: DateFormatter())
    }

    public func presenter() -> SearchResultsPresenter{
        return SearchResultsPresenter(detailNavigator: detailAssembly.detailNavigator())
    }
    
    public func searchNavigatorProtocol () -> SearchNavigatorProtocol {
        return PhoneSearchNavigator(viewControllerProvider: self)
    }
    
}

extension SearchAssembly: SearchResultsViewControllerProvider{
    func searchResultsViewController () -> SearchResultsViewController {
        return SearchResultsViewController(presenter: presenter(), resultCellPresenter: searchResultCellPresenter())
    }
}

