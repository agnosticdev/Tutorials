//
//  XCTestTestTests.swift
//  XCTestTestTests
//
//  Created by Matt Eaton on 6/25/18.
//  Copyright © 2018 Matt Eaton. All rights reserved.
//

import XCTest
@testable import XCTestTest

class XCTestTestTests: XCTestCase {
    
    let dateNow = Date()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Test that the coupon can be created with a successful set of values
    func testCouponSuccess() {
        guard let futureDate = Calendar.current.date(byAdding: .day, value: 5, to: dateNow) else {
            XCTFail("testCouponSuccess() failed")
            return
        }
        let coupon = Coupon(start: dateNow, end: futureDate, couponAmount: 5.0)
        
        XCTAssertTrue(coupon.isValid, "testCouponSuccess() succeeded")
    }
    
    // Test that the coupon can be flagged as invalid with an extended date range
    func testCouponDateFailure() {
        guard let futureDate = Calendar.current.date(byAdding: .day, value: 15, to: dateNow) else {
            XCTFail("testCouponDateFailure() failed")
            return
        }
        let coupon = Coupon(start: dateNow, end: futureDate, couponAmount: 5.0)
        
        XCTAssertFalse(coupon.isValid, "testCouponDateFailure() correctly validated")
    }
    
    // Test that the coupon can be flagged as invalid with a amount that is too large
    func testCouponAmountFailure() {
        guard let futureDate = Calendar.current.date(byAdding: .day, value: 5, to: dateNow) else {
            XCTFail("testCouponSuccess() failed")
            return
        }
        let coupon = Coupon(start: dateNow, end: futureDate, couponAmount: 15.0)
        
        XCTAssertFalse(coupon.isValid, "testCouponAmountFailure() correctly validated")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
