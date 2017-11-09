//
//  CityCityInteractorTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class CityInteractorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockPresenter: CityInteractorOutput {
        func changeUserSuccessful(_ user: User) {
            
        }
        
        func changeUserFailed(_ error: Error) {
            
        }
        
        func loadCitiesSuccessful(_ cities: [City]) {
            
        }
        
        func loadCitiesFailed(_ error: Error) {
            
        }
        
        
    }
}
