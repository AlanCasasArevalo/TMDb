//
//  PosterStripView.swift
//  APP Core
//
//  Created by Alan Casas on 04/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final public class PosterStripView : UIView, NibLoadableView {
    
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var collectionView: UICollectionView!

    
    var title: String {
        get { return titleLabel.text ?? "" }
        set { titleLabel.text = newValue.uppercased() }
    }
    
    
    
}
