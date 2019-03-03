//
//  PosterStripCollectionCell.swift
//  APP Core
//
//  Created by Alan Casas on 03/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit
import RxSwift

class PosterStripCollectionCell: UICollectionViewCell, ReusableView, NibLoadableView {
    @IBOutlet weak var posterStripTitleLabel: UILabel!
    @IBOutlet weak var posterStripMetadataLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    public var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
        disposeBag = DisposeBag()
    }

}
