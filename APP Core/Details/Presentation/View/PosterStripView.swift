//
//  PosterStripView.swift
//  APP Core
//
//  Created by Alan Casas on 04/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final public class PosterStripView : UIView, NibLoadableView {
    
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var collectionView: UICollectionView!

    
    var title: String {
        get { return titleLabel.text ?? "" }
        set { titleLabel.text = newValue.uppercased() }
    }
    
    var presenter : PosterStripPresenter?
    private let _items = Variable<[PosterStripItem]>([])

    var items: [PosterStripItem] {
        get { return _items.value }
        set { _items.value = newValue }
    }
    
    var itemSelected: ControlEvent<PosterStripItem> {
        return collectionView.rx.modelSelected(PosterStripItem.self)
    }
    
    let disposeBag = DisposeBag()
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(PosterStripCollectionCell.self)
        
        _items.asObservable()
            .bind(to: collectionView.rx.items) { [weak self] collectionView, index, item in
                let cell = collectionView.dequeueReusableCell(PosterStripCollectionCell.self, for: index)
                self?.presenter?.present(item: item, cell: cell)
                return cell
            }
            .disposed(by: disposeBag)
        
    }
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: CONSTANTS.POSTER_STRIP_VIEW_CONSTANTS.cgSizeHeight)
    }
    
}
