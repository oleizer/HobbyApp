//
//  ActivityDetailActivityDetailViewOutput.swift
//  HobbyApp
//
//  Created by Oleg Leizer on 10/11/2017.
//  Copyright © 2017 idev.kz. All rights reserved.
//

protocol ActivityDetailViewOutput {

    /**
        @author Oleg Leizer
        Notify presenter that view is ready
    */

    func viewIsReady()
    func numberOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func sectionType(inSection section: Int) -> SectionType
    func infoRowType(inRow row: Int) -> InfoRowType

    func getActivity() -> Activity
}
