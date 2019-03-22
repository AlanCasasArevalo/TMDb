//
//  FeaturedPresenterTest.swift
//  APP_CoreTests
//
//  Created by Alan Casas on 22/03/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import XCTest
@testable import APP_Core

class FeaturedPresenterTest: XCTestCase {
    
    var sut: FeaturedPresenter!
    
    // Collaborators
    var detailNavigatorMock: DetailNavigatorMock!
    var featuredRepositoryMock: FeaturedRepositoryMock!
    

    override func setUp() {
        detailNavigatorMock = DetailNavigatorMock()
        featuredRepositoryMock = FeaturedRepositoryMock()
        
        sut = FeaturedPresenter(detailNavigator: detailNavigatorMock, featuredRepositoryProtocol: featuredRepositoryMock)
    }

    func testFeaturedPresenter_didSelectShow_navigatesToShow() {
        // Given
        // featured presenter
        
        // When
        let show = Show(identifier: 42, title: "Test", posterPath: nil, backdropPath: nil, firstAirDate: nil, genreIdentifiers: nil)
        sut.didSelect(show: show)
        
        // Then
        XCTAssertTrue(detailNavigatorMock.showDetailCalled)
        
        let (identifier, mediaType) = detailNavigatorMock.showDetailParameters!
        XCTAssertEqual(42, identifier)
        XCTAssertEqual(.show, mediaType)
    }
    
    func testFeaturedPresenter_didSelectMovie_navigatesToShow() {
        // Given
        // featured presenter
        
        // When
        let movie = Movie(identifier: 42, title: "Test", posterPath: nil, backdropPath: nil, releaseDate: nil, genreIdentifiers: nil)
        sut.didSelect(movie: movie)
        
        // Then
        XCTAssertTrue(detailNavigatorMock.showDetailCalled)
        
        let (identifier, mediaType) = detailNavigatorMock.showDetailParameters!
        XCTAssertEqual(42, identifier)
        XCTAssertEqual(.movie, mediaType)
    }
    
}
