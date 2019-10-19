//
//  AboutPlacesTests.swift
//  AboutPlacesTests
//
//  Created by sohail ur rahman on 16/10/19.
//  Copyright © 2019 sohail ur rahman. All rights reserved.
//

import XCTest
@testable import AboutPlaces

class AboutPlacesTests: XCTestCase {
 
    //URL String Test
 func testValidURLString() {
   XCTAssertEqual(FACTS_URL, "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
}

    func testValidCellIDString() {
       XCTAssertEqual(FACT_CELL_ID, "FactsCell")
 }
    

//Testing Json Response. It is totally network dependent. we can use Libraries such as Mockingay,Hippolyte, OHHTTPStubs stubbing libraries to stub the request and response
func testTitleString() {
    guard let gitUrl = URL(string:FACTS_URL) else { return }
    let promise = expectation(description: "Simple Request")
    URLSession.shared.dataTask(with: gitUrl) { (data, response
        , error) in
        guard let data = data else { return }
        let decoder = JSONDecoder()
        do {
            // Decode data to object
            let utf8Data = String(decoding: data, as: UTF8.self).data(using: .utf8)
            let object = try decoder.decode(Facts.self, from: utf8Data!)
            XCTAssertTrue(object.title! == "About Canada")
            promise.fulfill()

        } catch let err {
            print("Err", err)
        }
        }.resume()
    waitForExpectations(timeout: 5, handler: nil)
}
}
