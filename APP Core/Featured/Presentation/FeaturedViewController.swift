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

public class FeaturedViewController: UIViewController {
    
    @IBOutlet weak var moviesLabel: UILabel!
    @IBOutlet weak var showsLabel: UILabel!
    @IBOutlet weak var moviesStackView: UIStackView!
    @IBOutlet weak var showsStackView: UIStackView!

    public let featurePresenter: FeaturedPresenter
    public let cardPresenter: CardPresenter
    public let disposeBag = DisposeBag()

    public init(featurePresenter: FeaturedPresenter, cardPresenter: CardPresenter){
        self.featurePresenter = featurePresenter
        self.cardPresenter = cardPresenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        featurePresenter.featureViewProtocol = self
        featurePresenter.didLoad()
        
    }
}


extension FeaturedViewController: FeaturedViewProtocol{
    public func setMoviesHeaderTitle(title: String) {
        showsLabel.text = title
    }
    
    public func setShowsHeaderTitle(title: String) {
        moviesLabel.text = title
    }
    
    public func updateView(with movies: [Movie]) {
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
    
    public func updateView(with shows: [Show]) {
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




















