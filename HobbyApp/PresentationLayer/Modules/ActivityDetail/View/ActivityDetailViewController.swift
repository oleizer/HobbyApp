//
//  ActivityDetailActivityDetailViewController.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController, ActivityDetailViewInput, ModuleTransitionDestination {

    var output: ActivityDetailViewOutput!
    var moduleInput: ModuleInput!

    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: ActivityDetailViewInput
    func setupInitialState() {
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension

        tableView.register(ActivityDetailImageCell.self)
        tableView.register(ActivityDetailDescriptionCell.self)
        tableView.register(ActivityDetailInfoCell.self)
    }
}

extension ActivityDetailViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return output.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.numberOfRows(inSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch output.sectionType(inSection: indexPath.section) {
        case .header:
            let model = ActivityDetailImageCellModel(model: output.getActivity())
            return tableView.dequeueReusableCell(withModel: model, for: indexPath)
        case .detail:
            let model = ActivityDetailDescriptionCellModel(model: output.getActivity())
            return tableView.dequeueReusableCell(withModel: model, for: indexPath)
        case .info:
            switch output.infoRowType(inRow: indexPath.row) {
            case .organizer:
                let model = ActivityDetailInfoCellModel(info: L10n.Activitydetail.Cell.organizer, detail: output.getActivity().organizer.name)
                return tableView.dequeueReusableCell(withModel: model, for: indexPath)
            case .age:
                let model = ActivityDetailInfoCellModel(info: L10n.Activitydetail.Cell.age, detail: "от \(output.getActivity().ageFrom) до \(output.getActivity().ageTo)")
                return tableView.dequeueReusableCell(withModel: model, for: indexPath)
            case .address:
                let model = ActivityDetailInfoCellModel(info: L10n.Activitydetail.Cell.organizer, detail: output.getActivity().organizer.name)
                return tableView.dequeueReusableCell(withModel: model, for: indexPath)
            case .price:
                let model = ActivityDetailInfoCellModel(info: L10n.Activitydetail.Cell.organizer, detail: output.getActivity().organizer.name)
                return tableView.dequeueReusableCell(withModel: model, for: indexPath)
            }
        }
    }
    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        //output.didSelectRow(atIndex: indexPath.row)
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 270
//    }
}
