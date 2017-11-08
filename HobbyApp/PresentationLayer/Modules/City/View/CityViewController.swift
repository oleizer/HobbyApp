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
    @IBOutlet private weak var tableView: UITableView!
    private var doneButton = UIBarButtonItem()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: CityViewInput
    func setupInitialState() {
        setupView()
    }

    func showContent() {
        tableView.reloadData()
    }

    func showNoContent() {

    }

    func changeDoneState(isEnabled: Bool) {
        doneButton.isEnabled = isEnabled
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
        doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        self.navigationItem.rightBarButtonItem = doneButton
        //doneButton.isEnabled = false
        tableView.register(CityTableViewCell.self)
    }

    // MARK: - Actions
    @objc private func doneAction() {
        output.doneAction()
    }
}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = CityCellModel(city: output.city(atIndex: indexPath.row))
        return tableView.dequeueReusableCell(withModel: model, for: indexPath)
    }
    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selected: City = output.city(atIndex: indexPath.row)
        //self.selectedCity = selected
        //print("Select city: \(self.selectedCity?.name ?? "Unknown")")

//        if (self.selectedCity != nil) {
//            doneButton.isEnabled = true
//        }else{
//            doneButton.isEnabled = false
//        }

        output.didSelectCity(selected)
    }
}
