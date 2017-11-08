//
//  InterestInterestInteractor.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 09/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

class InterestInteractor: InterestInteractorInput {

    weak var output: InterestInteractorOutput!
    func loadInterests() {
        InterestService().fetchAllInterests().thenFinally(execute: { interests in
            self.output.loadInterestsSuccessful(interests)
        }).catch(execute: { error in
            self.output.loadInterestsFailed(error)
        })
    }
}
