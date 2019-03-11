//
//  DetailPresenterProtocol.swift
//  APP Core
//
//  Created by Alan Casas on 08/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation


public protocol DetailPresenterProtocol: class {
    weak var view: DetailViewProtocol? { get set }
    
    func didLoad()
    func didSelect(item: PosterStripItem)
}