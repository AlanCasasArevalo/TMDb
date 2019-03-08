//
//  CardView.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit
import RxSwift

class CardView: UIView, NibLoadableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var tapGestureRecognizer: UITapGestureRecognizer!
    
    let disposeBag = DisposeBag()
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: UIViewNoIntrinsicMetric, height: CONSTANTS.CARD_VIEW_CONSTANTS.cgSizeHeight)
    }

}
