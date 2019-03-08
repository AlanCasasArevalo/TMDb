//
//  DetailPresenter.swift
//  APP Core
//
//  Created by Alan Casas on 08/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

public protocol DetailViewProtocol: class{
    func setLoading(loading: Bool)
    func updateView(sections: [DetailSection])
}






