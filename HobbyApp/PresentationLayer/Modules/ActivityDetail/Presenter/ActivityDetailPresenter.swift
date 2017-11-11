//
//  ActivityDetailActivityDetailPresenter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class ActivityDetailPresenter: ActivityDetailModuleInput, ActivityDetailViewOutput, ActivityDetailInteractorOutput {

    weak var view: ActivityDetailViewInput!
    var interactor: ActivityDetailInteractorInput!
    var router: ActivityDetailRouterInput!

    private var activity: Activity!    

    // MARK: - ActivityDetailViewOutput
    func viewIsReady() {
        view.setupInitialState()
        print(activity)
    }
    // MARK: - ActivityDetailModuleInput
    func setActivity(activity: Activity) {
        self.activity = activity
        print("zz")
    }
    func saveActivity(_ activity: Activity) {
        self.activity = activity
        print("zz")

    }
}
