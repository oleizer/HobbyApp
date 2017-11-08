//
//  CityCityPresenterTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class CityPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: CityInteractorInput {
        func setCity(_ cityId: Int) {
            
        }
        
        func loadCities() {
            print("load")
        }
    }

    class MockRouter: CityRouterInput {
        func showInterest() {
            
        }
        
        func showAddCity() {
            print("Show city")
        }
        

    }

    class MockViewController: CityViewInput {
        func showContent() {
            
        }
        
        func showNoContent() {
            
        }
        
        func changeDoneState(isEnabled: Bool) {
            
        }
        
        func setCities(cities: [City]) {
            
        }
        
        func showProgress() {
            
        }
        
        func hideProgress() {
            
        }
        

        func setupInitialState() {

        }
    }
}
