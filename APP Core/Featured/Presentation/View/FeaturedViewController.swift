//
//  FeaturedViewController.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FeaturedViewController: UIViewController {
    
    @IBOutlet weak var moviesLabel: UILabel!
    @IBOutlet weak var showsLabel: UILabel!
    @IBOutlet weak var moviesStackView: UIStackView!
    @IBOutlet weak var showsStackView: UIStackView!

    let featurePresenter: FeaturedPresenter
    let cardPresenter: CardPresenter
    let searchNavigatorProtocol: SearchNavigatorProtocol
    let disposeBag = DisposeBag()

    init(featurePresenter: FeaturedPresenter, cardPresenter: CardPresenter, searchNavigatorProtocol: SearchNavigatorProtocol){
        self.featurePresenter = featurePresenter
        self.cardPresenter = cardPresenter
        self.searchNavigatorProtocol = searchNavigatorProtocol
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchNavigatorProtocol.installSearch(viewController: self)
        featurePresenter.featureViewProtocol = self
        featurePresenter.didLoad()
        
    }
}


extension FeaturedViewController: FeaturedViewProtocol{
    func setMoviesHeaderTitle(title: String) {
        moviesLabel.text = title
    }
    
    func setShowsHeaderTitle(title: String) {
        showsLabel.text = title
    }
    
    func updateView(with movies: [Movie]) {
        moviesStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        let cardViews: [UIView] = movies.map { movie  in
            let cardView = CardView.instantiate()
            cardPresenter.presentMovie(movie: movie, cardView: cardView)
            cardView.tapGestureRecognizer.rx.event
                .subscribe(onNext: { gesture in
                    self.featurePresenter.didSelect(movie: movie)
                }, onError: { error in
                    print(error.localizedDescription)
                })
                .disposed(by: disposeBag)
            
            return cardView
        }
        
        cardViews.forEach { view in
            moviesStackView.addArrangedSubview(view)
        }
    }
    
    func updateView(with shows: [Show]) {
        showsStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        let cardViews: [UIView] = shows.map { show  in
            let cardView = CardView.instantiate()
            cardPresenter.presentShow(show: show, cardView: cardView)
            cardView.tapGestureRecognizer.rx.event
                .subscribe(onNext: { gesture in
                    self.featurePresenter.didSelect(show: show)
                }, onError: { error in
                    print(error.localizedDescription)
                })
                .disposed(by: disposeBag)
            
            return cardView
        }
        
        cardViews.forEach { view in
            showsStackView.addArrangedSubview(view)
        }
    }
}




















