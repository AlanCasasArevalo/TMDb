//
//  SearchResultCell.swift
//  APP Core
//
//  Created by Alan Casas on 02/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

public class SearchResultCell: UITableViewCell, ReusableView, NibLoadableView {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var headlineLabel:UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var metaDataLabel: UILabel!
    
    public var disposeBag = DisposeBag()
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
        disposeBag = DisposeBag()
    }
}
