//
//  CitySpec.swift
//  Specs
//
//  Created by Олег Лейзер on 12.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Quick
import Nimble
@testable import HobbyApp

class CitySpec: QuickSpec {
    override func spec() {
        describe("City") {
            it("parse correctly", closure: {
                let data = stubbedJSONData(fileName: "city")
                let city = City.fromJSON(data) as! City
                expect(city.id) == 22
                expect(city.name) == "Караганда"
            })
        }
        describe("NSCoding") {
            var filePath = ""
            if let url = URL(string: FileManager.AppDocumentsDir()) {
                filePath = url.appendingPathComponent("CitySpec").absoluteString
            }
            afterEach {
                do {
                    try FileManager.default.removeItem(atPath: filePath)
                }
                catch {
                    
                }
            }
            context("Coding", closure: {
                it("encodes successfully", closure: {
                    let city: City = stub([:])
                    let wasSuccessfulArchived = NSKeyedArchiver.archiveRootObject(city, toFile: filePath)
                    expect(wasSuccessfulArchived).to(beTrue())
                })
            })
            context("Decoding", closure: {
                it("decode", closure: {
                    let city: City = stub(["id": 22, "name": "Караганда"])
                    NSKeyedArchiver.archiveRootObject(city, toFile: filePath)
                    let unArchivedActivity = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as! City
                    
                    expect(unArchivedActivity).toNot(beNil())
                    expect(unArchivedActivity.name) == "Караганда"
                    expect(unArchivedActivity.id) == 22
                    
                })
            })
        }
    }
    
}
