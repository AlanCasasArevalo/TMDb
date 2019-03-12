//
//  DetailViewController.swift
//  APP Core
//
//  Created by Alan Casas on 03/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

protocol DetailViewControllerProviderProtocol: class {
    func detailViewController ( identifier: Int64, mediaType: MediaType ) -> UIViewController
}

public class DetailViewController: UIViewController {

    @IBOutlet weak var detailScrollView: UIScrollView!
    @IBOutlet weak var detailStackView: UIStackView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    
    
    public let detailPresenter: DetailPresenterProtocol
    public let detailHeaderPresenter: DetailHeaderPresenter
    public let posterStripPresenter: PosterStripPresenter
    
    public init(detailPresenter: DetailPresenterProtocol, detailHeaderPresenter: DetailHeaderPresenter, posterStripPresenter: PosterStripPresenter){
        self.detailPresenter = detailPresenter
        self.detailHeaderPresenter = detailHeaderPresenter
        self.posterStripPresenter = posterStripPresenter
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        detailPresenter.view = self
        detailPresenter.didLoad()
    }

}

extension DetailViewController: DetailViewProtocol {
    public func setLoading(loading: Bool) {
        if loading {
            detailScrollView.isHidden = true
            loadingView.startAnimating()
        } else {
            detailScrollView.isHidden = false
            loadingView.stopAnimating()
        }
    }
    
    public func updateView(sections: [DetailSection]) {
        detailStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }

        sections.forEach { detailSections in
            addView(section: detailSections)
        }
    }
}

private extension DetailViewController {
    func addView (section: DetailSection) {
        let view: UIView
        
        switch section {
        case .header(let header):
            view = headerView(header: header)
        case .about(let title, let detail):
            view = aboutView(title: title, detail: detail)
        case .posterStrip(let title, let items):
            view = posterStrip(title: title, items: items)
        }
        
        detailStackView.addArrangedSubview(view)
    }
    
    func headerView (header: DetailHeader) -> UIView {
        let headerView = DetailHeaderView.instantiate()
        detailHeaderPresenter.present(header: header, view: headerView)
        return headerView
    }
    
    func aboutView (title: String, detail: String) -> UIView {
        let aboutView = DetailAboutView.instantiate()
        aboutView.detailAboutTitleLabel.text = title.uppercased()
        aboutView.detailAboutTitleLabel.text = detail
        return aboutView
    }
    
    func posterStrip (title: String, items: [PosterStripItem]) -> UIView {
        let posterStripView = PosterStripView.instantiate()
        posterStripView.presenter = posterStripPresenter
        posterStripView.title = title
        posterStripView.items = items
        
        posterStripView.itemSelected
            .subscribe(onNext: { [weak self] item in
                self?.detailPresenter.didSelect(item: item)
            })
            .disposed(by: posterStripView.disposeBag)
        return posterStripView
    }
    
}



























