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
    let webServiceAssembly: WebServiceAssembly
    
    init(imageLoadingAssembly: ImageLoadingAssembly, detailAssembly: DetailsAssembly, webServiceAssembly: WebServiceAssembly) {
        self.imageLoadingAssembly = imageLoadingAssembly
        self.detailAssembly = detailAssembly
        self.webServiceAssembly = webServiceAssembly
    }
    
    func searchResultCellPresenter() -> SearchResultCellPresenter{
        return SearchResultCellPresenter(imageRepositoryProtocol: imageLoadingAssembly.imageRepository, dateFormatter: DateFormatter())
    }

    func presenter() -> SearchResultsPresenter{
        return SearchResultsPresenter(detailNavigator: detailAssembly.detailNavigator(), searchResultsRepositoryProtocol: searchResultsRepository())
    }
    
    func searchNavigatorProtocol () -> SearchNavigatorProtocol {
        return PhoneSearchNavigator(viewControllerProvider: self)
    }
    
    func searchResultsRepository() -> SearchResultsRepositoryProtocol {
        return SearchResultsRepository(webService: webServiceAssembly.webService)
    }
    
}

extension SearchAssembly: SearchResultsViewControllerProvider{
    func searchResultsViewController () -> SearchResultsViewController {
        return SearchResultsViewController(presenter: presenter(), resultCellPresenter: searchResultCellPresenter())
    }
}

