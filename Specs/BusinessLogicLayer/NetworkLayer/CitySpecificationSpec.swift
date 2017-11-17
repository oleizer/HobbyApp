//
//  CitySpecificationSpec.swift
//  Specs
//
//  Created by Олег Лейзер on 17.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Quick
import Nimble
@testable import HobbyApp

class CitySpecificationSpec: QuickSpec {
    override func spec() {
        describe("CitySpecification", closure: {
            describe("paths", closure: {
                context("are valid", closure: {
                    let expectations: [(CitySpecification, String)] = [
                        (.cityId(cityId: 1), "/api/city/1"),
                        (.searchCity(keyword: "foo"), "/api/city/search"),
                        (.cities, "/api/city"),
                    ]
                    for (api, path) in expectations {
                        it("\(api).path is valid", closure: {
                            expect(api.path) == path
                        })
                    }
                })
            })
            describe("mappingType", closure: {
                let expectations: [(CitySpecification, MappingType)] = [
                    (.cities, .city)
                ]
                for (endpoint, mappingType) in expectations {
                    it("\(endpoint) has the correct mappingType \(mappingType)", closure: {
                        expect(endpoint.mappingType) == mappingType
                    })
                }
            })
            describe("headers", closure: {
                context("Accept-Language endpoints", closure: {
                    let endpoints: [CitySpecification] = [
                        .cities,
                    ]
                    for endpoint in endpoints {
                        it("\(endpoint) has the correct headers", closure: {
                            //expect(endpoint.headers!["Accept-Language"]) == ""
                            //expect(endpoint.headers!["Accept"]) == "application/json"
                            //expect(endpoint.headers!["Content-Type"]) == "application/json"

                        })
                    }
                })
            })
        })
    }
}
