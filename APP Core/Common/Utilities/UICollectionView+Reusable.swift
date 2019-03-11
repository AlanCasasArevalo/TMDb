//
//  UICollectionView+Reusable.swift
//  APP Core
//
//  Created by Alan Casas on 01/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

extension UICollectionView {
    func register<GenericCell: UICollectionViewCell>(_: GenericCell.Type) where GenericCell: ReusableView {
        register(GenericCell.self, forCellWithReuseIdentifier: GenericCell.defaultReuseIdentifier)
    }
    
    func register<GenericCell: UICollectionViewCell>(_: GenericCell.Type) where GenericCell: ReusableView, GenericCell: NibLoadableView {
        let bundle = Bundle(for: GenericCell.self)
        let nib = UINib(nibName: GenericCell.nibName, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: GenericCell.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<GenericCell: UICollectionViewCell>(_: GenericCell.Type, for indexPath: IndexPath) -> GenericCell where GenericCell: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: GenericCell.defaultReuseIdentifier, for: indexPath) as? GenericCell else {
            fatalError("Could not dequeue cell with identifier: \(GenericCell.defaultReuseIdentifier)")
        }
        
        return cell
    }
    
    func dequeueReusableCell<GenericCell: UICollectionViewCell>(_: GenericCell.Type, for item: Int) -> GenericCell where GenericCell: ReusableView {
        return dequeueReusableCell(GenericCell.self, for: IndexPath(item: item, section: 0))
    }
}
