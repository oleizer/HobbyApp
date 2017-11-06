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
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!

    
    private var cities: [City] = []
    
    var allCities:[City]?

//    var cities:[City] = []{
//        didSet {
//            print(self.cities.count)
//        }
//    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func loadCities() {
        
    }

    // MARK: CityViewInput
    func setupInitialState() {
        self.navigationItem.title = L10n.City.Navigation.title
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        self.navigationItem.rightBarButtonItem = addButton
        loadCities()
        
        CityService().fetchAllCities().thenFinally{ [weak self] cities in
            guard let `self` = self else { return }
            self.cities = cities
            self.tableView.reloadData()
        }.ignoreErrors()
        
//        let cities = CityService().fetchAllCities().thenFinally{ [weak self] ci in
//            guard let `self` = self else { return }
//            print("HUI: \(ci)")
//            self.cities = ci
//            self.tableView.reloadData()
//            }.always {
//                print("Aplways")
//                print(self.cities[0].name)
//                self.tableView.reloadData()
//            }.thenFinally {
//                self.tableView.reloadData()
//
//        }
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
    @objc func addAction() {
        print("Add Action")
        output.addCityAction()
    }
}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
                return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
            }
            return cell
        }()
        cell.textLabel?.text = "Row: \(self.cities[indexPath.row].name)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = self.cities[indexPath.row]
        print("Select city: \(selectedCity.name)")
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
