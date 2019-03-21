//
//  SearchResultsViewController.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxCocoa
import RxSwift

protocol SearchResultsViewControllerProvider: class {
    func searchResultsViewController () -> SearchResultsViewController
}

class SearchResultsViewController: UITableViewController {
    
    private let presenter: SearchResultsPresenter
    private let resultCellPresenter: SearchResultCellPresenter
    private let disposeBag = DisposeBag()
    
    init(presenter: SearchResultsPresenter, resultCellPresenter: SearchResultCellPresenter) {
        self.presenter = presenter
        self.resultCellPresenter = resultCellPresenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        tableView.dataSource = nil
        self.bindPresenters()
    }
    
}

private extension SearchResultsViewController {
    
    func setupView() {
        tableView.register(SearchResultCell.self)
        tableView.separatorInset = CONSTANTS.TABLE_VIEW_CONSTANTS.separatorInset
        tableView.rowHeight = CONSTANTS.TABLE_VIEW_CONSTANTS.rowHeight
    }

    func bindPresenters() {
        presenter.searchResults
            .bind(to: tableView.rx.items) { [weak self] tableView, index, searchResult in
                let cell = tableView.dequeueReusableCell(SearchResultCell.self)
                self?.resultCellPresenter.present(searchResult: searchResult, cell: cell)
                return cell
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(SearchResult.self)
            .subscribe(onNext: { [weak self] result in
                self?.presenter.didSelect(searchResult: result)
                }, onError: { error in
                    print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
        
    }
    
}

extension SearchResultsViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        presenter.query.value = searchController.searchBar.text ?? ""
        // TODO: Here you can see the query 
        print(presenter.query.value)
    }
}



























