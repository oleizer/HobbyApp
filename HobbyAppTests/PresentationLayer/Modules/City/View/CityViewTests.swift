//
//  CityCityViewTests.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import XCTest
@testable import HobbyApp

class CityViewTests: XCTestCase {
    private var view: CityViewController?
    private var output: CityViewOutputMock?
    
    override func setUp() {
        super.setUp()
        view = CityViewController()
        output = CityViewOutputMock()
        view?.output = output
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testSuccessViewDidLoad() {
        self.view?.viewDidLoad()
        XCTAssert(self.output?.viewIsReadyWasCalled == true)
    }
    func testSuccessLoadCityWasCalled(){
        self.view?.viewDidLoad()
        XCTAssert(self.output?.loadCityWasCalled == true)
    }
    
    final class CityViewOutputMock: CityViewOutput {
        func city(atIndex index: Int) -> City {
            return City(id: 1, name: "D")
        }
        
        func numberOfRows() -> Int {
            return 1
        }
        
        func didSelectCity(_ city: City) {
            
        }
        
        func doneAction() {
            
        }
        
        var viewIsReadyWasCalled: Bool = false
        var loadCityWasCalled: Bool = false
        
        func loadCities() {
            loadCityWasCalled = true
        }
        
        func viewIsReady() {
            viewIsReadyWasCalled = true
        }
    }
}
