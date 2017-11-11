//
//  ActivityActivityPresenter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class ActivityPresenter: ActivityModuleInput, ActivityViewOutput, ActivityInteractorOutput {
    weak var view: ActivityViewInput!
    var interactor: ActivityInteractorInput!
    var router: ActivityRouterInput!

    private var activities: [Activity] = [Activity]() {
        didSet {
            if activities.count > 0 {
                view.showContent()
            }else{
                view.showNoContent()
            }
        }
    }


    func viewIsReady() {
        view.setupInitialState()
        loadInterests()
    }
    
    func didSelectRow(atIndex index: Int) {
        guard let model: Activity = activities[index] else { return }
        router.showActivityDetail(model)
    }

    private func loadInterests() {
        view.showProgress()
        interactor.loadActivities()
    }

    func object(atIndex index: Int) -> Activity {
        return activities[index]
    }

    func numberOfRows() -> Int {
        return activities.count
    }

    func loadActivitiesFailed(_ error: Error) {
        view.hideProgress()
    }
    func loadActivitiesSuccessful(_ activities: [Activity]) {
        view.hideProgress()
        self.activities = activities
    }
}
