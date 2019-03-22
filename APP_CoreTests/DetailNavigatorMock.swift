//
//  DetailNavigatorMock.swift
//  APP_CoreTests
//
//  Created by Alan Casas on 22/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

@testable import APP_Core

final class DetailNavigatorMock: DetailNavigatorProtocol {
    private(set) var showDetailCalled: Bool = false
    private(set) var showDetailParameters: (Int64, MediaType)?
    
    func showDetail(identifier: Int64, mediaType: MediaType) {
        showDetailCalled = true
        showDetailParameters = (identifier, mediaType)
    }
}
