//
//  CanadaServiceTest.swift
//  CanadaServiceTest
//
//  Created by Sweet on 04/08/18.
//  Copyright © 2018 Sweet. All rights reserved.
//

import XCTest
@testable import Canada


class CanadaServiceTest: XCTestCase{
    
    var canadaFactsList : FactsModel?
    var service : FactsService = FactsService()


    func UpdateFactsDataInUI(factsData: FactsModel) {
        canadaFactsList = factsData
        
        
    }
    
    func serviceFailedWithError(error: Error) {
    
    }
    
    func networkfailureAlert(message: String) {
        
    }
    

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUrl() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        service.fetchJsonObject()
    }
    
    func testServiceMethodCall() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let facctsJsonString: String = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        let factsUrl = URL(string: facctsJsonString)
        let urlRequest = URLRequest(url: factsUrl!)
        XCTAssert(urlRequest != nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            let service : FactsService = FactsService()
            service.fetchJsonObject()
        }
    }
    
}
