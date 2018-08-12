//
//  CanadaFactsCellTest.swift
//  CanadaServiceTest
//
//  Created by Sweet on 12/08/18.
//  Copyright © 2018 Sweet. All rights reserved.
//

import XCTest
@testable import Canada

class CanadaFactsCellTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFactsCellElements() {

        let cell : FactsCell = FactsCell()
        //to check if all cell elemts are available or not
        XCTAssert(cell.imageFact != nil);
        XCTAssert(cell.labelDescription != nil);
        XCTAssert(cell.labelTitle != nil);
    }
    

    
}
