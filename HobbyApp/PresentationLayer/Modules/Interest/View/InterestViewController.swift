//
//  InterestInterestViewController.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 09/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class InterestViewController: UIViewController, InterestViewInput {
    @IBOutlet private weak var tableView: UITableView!
    var output: InterestViewOutput!
    // MARK: IBOutlet

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    // MARK: InterestViewInput
    func setupInitialState() {
        tableView.register(InterestTableViewCell.self)
    }
    func showContent() {
        tableView.reloadData()
    }

    func showNoContent() {

    }
}

extension InterestViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withModel: InterestCellModel(interest: output.object(atIndex: indexPath.row)), for: indexPath)
    }
    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selected: Interest = output.object(atIndex: indexPath.row)
        //self.selectedCity = selected
        //print("Select city: \(self.selectedCity?.name ?? "Unknown")")

        //        if (self.selectedCity != nil) {
        //            doneButton.isEnabled = true
        //        }else{
        //            doneButton.isEnabled = false
        //        }

        //output.didSelectCity(selected)
    }
}
