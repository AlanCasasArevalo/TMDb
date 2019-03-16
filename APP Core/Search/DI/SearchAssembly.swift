//
//  SearchAssembly.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final class SearchAssembly {
    
    let imageLoadingAssembly: ImageLoadingAssembly
    let detailAssembly: DetailsAssembly
    
    init(imageLoadingAssembly: ImageLoadingAssembly, detailAssembly: DetailsAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly = detailAssembly
    }
    
    func searchResultCellPresenter() -> SearchResultCellPresenter{
        return SearchResultCellPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository, dateFormatter: DateFormatter())
    }

    func presenter() -> SearchResultsPresenter{
        return SearchResultsPresenter(detailNavigator: detailAssembly.detailNavigator())
    }
    
    func searchNavigatorProtocol () -> SearchNavigatorProtocol {
        return PhoneSearchNavigator(viewControllerProvider: self)
    }
    
}

extension SearchAssembly: SearchResultsViewControllerProvider{
    func searchResultsViewController () -> SearchResultsViewController {
        return SearchResultsViewController(presenter: presenter(), resultCellPresenter: searchResultCellPresenter())
    }
}

