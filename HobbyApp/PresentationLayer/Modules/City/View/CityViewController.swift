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
    private var selectedCity: City?
    private var cities: [City] = []
    private var interests: [Interest] = []

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: CityViewInput
    func setupInitialState() {
        setupView()
        //loadCities()
        output.loadCities()
    }

    // MARK: - Private
    private func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        
        navigationItem.title = L10n.City.Navigation.title
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        self.navigationItem.rightBarButtonItem = addButton
    }

    // MARK: - Actions
    @objc private func addAction() {
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
    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selected: City = self.cities[indexPath.row]
        self.selectedCity = selected
        print("Select city: \(self.selectedCity?.name ?? "Unknown")")
    }
}
