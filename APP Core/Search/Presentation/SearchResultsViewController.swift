//
//  SearchResultsViewController.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxCocoa
import RxSwift

public class SearchResultsViewController: UITableViewController {
    
    public let presenter: SearchResultsPresenter
    public let resultCellPresenter: SearchResultCellPresenter
    public let disposeBag = DisposeBag()
    
    public init(presenter: SearchResultsPresenter, resultCellPresenter: SearchResultCellPresenter) {
        self.presenter = presenter
        self.resultCellPresenter = resultCellPresenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.bindPresenters()        
    }
    
}

extension SearchResultsViewController {
    
    public func setupView() {
        tableView.register(SearchResultCell.self)
        tableView.separatorInset = CONSTANTS.TABLE_VIEW_CONSTANTS.separatorInset
        tableView.rowHeight = CONSTANTS.TABLE_VIEW_CONSTANTS.rowHeight
    }

    public func bindPresenters() {
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
    public func updateSearchResults(for searchController: UISearchController) {
        presenter.query.value = searchController.searchBar.text ?? ""
    }
}



























