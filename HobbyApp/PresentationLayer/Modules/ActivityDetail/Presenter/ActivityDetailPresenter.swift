//
//  ActivityDetailActivityDetailPresenter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//
enum SectionType {
    case header
    case detail
    case info
}
enum InfoRowType {
    case organizer
    case age
    case address
    case price
}
class ActivityDetailPresenter: ActivityDetailModuleInput, ActivityDetailViewOutput, ActivityDetailInteractorOutput {


    weak var view: ActivityDetailViewInput!
    var interactor: ActivityDetailInteractorInput!
    var router: ActivityDetailRouterInput!

    private var activity: Activity!
    private let sections: [SectionType] = [.header, .detail, .info]
    private let infoRows: [InfoRowType] = [.organizer, .age]
    // MARK: - ActivityDetailViewOutput
    func viewIsReady() {
        view.setupInitialState()
        print(activity)
    }

    func getActivity() -> Activity {
        return activity
    }
    func numberOfSections() -> Int {
        return sections.count
    }
    func numberOfRows(inSection section: Int) -> Int {
        switch sections[section] {
        case .header:
            return 1
        case .detail:
            return 1
        case .info:
            return infoRows.count
        }
    }

    func infoRowType(inRow row: Int) -> InfoRowType {
        return infoRows[row]
    }

    func sectionType(inSection section: Int) -> SectionType {
        return sections[section]
    }
    // MARK: - ActivityDetailModuleInput
    func setActivity(activity: Activity) {
        self.activity = activity
    }
}
