//
//  ActivityActivityInteractor.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class ActivityInteractor: ActivityInteractorInput {

    weak var output: ActivityInteractorOutput!
    func loadActivities() {
        let param = ["CityId": 1]
        ActivityService().searchActivity(params: param).thenFinally(execute: { result in
            self.output.loadActivitiesSuccessful(result)
        }).catch(execute: { error in
            self.output.loadActivitiesFailed(error)
        })
    }
}
