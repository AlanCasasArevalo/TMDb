//
//  DetailHeaderView.swift
//  APP Core
//
//  Created by Alan Casas on 03/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import RxSwift

class DetailHeaderView: UIView, NibLoadableView {
    
    @IBOutlet weak var detailBackdropImageView: UIImageView!
    @IBOutlet weak var detailPosterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: CONSTANTS.CARD_VIEW_CONSTANTS.cgSizeHeight)
    }
    
    
}
