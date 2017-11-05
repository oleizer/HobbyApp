//
//  CityCityViewController.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 03/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class CityViewController: UIViewController, CityViewInput {

    var output: CityViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: CityViewInput
    func setupInitialState() {
        
        let cities = CityService().fetchAllCities().thenFinally{ [weak self] ci in
            guard let `self` = self else { return }
            print("HUI: \(ci)")
            }.always {
                print("Aplways")
        }
//        CityService().fetchAllCities(success: {
//            print("s")
//        }) { (error) in
//            print("er")
//        }
//
//        CityService().fetchCity(by: 1)
        //CityService().fetchCity(by: 1)
        //CityService().fetchAllCities()
//        CityService().fetchAllCities(success: {
//            print("ssss")
//        }) { (error) in
//            print(error)
//        }

    }
}
