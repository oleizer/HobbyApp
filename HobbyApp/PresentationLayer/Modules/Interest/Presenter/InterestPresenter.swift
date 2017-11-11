//
//  InterestInterestPresenter.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 09/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class InterestPresenter: InterestModuleInput, InterestViewOutput, InterestInteractorOutput {

    weak var view: InterestViewInput!
    var interactor: InterestInteractorInput!
    var router: InterestRouterInput!

    private var interests: [Interest] = [Interest]() {
        didSet {
            if interests.count > 0 {
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

    private func loadInterests() {
        view.showProgress()
        interactor.loadInterests()
    }
    // MARK: - InterestViewOutput
    func object(atIndex index: Int) -> Interest {
        return interests[index]
    }

    func numberOfRows() -> Int {
        return interests.count
    }
    // MARK: - InterestInteractorOutput
    func loadInterestsSuccessful(_ interests: [Interest]) {
        view.hideProgress()
        self.interests = interests
    }

    func loadInterestsFailed(_ error: Error) {
        view.hideProgress()

    }
}
