//: Playground - noun: a place where people can play

import Foundation
import XCTest

class Coupon: NSObject {
    
    // The Coupon Object's Properties
    var startDate: Date?
    var endDate: Date?
    var amount: Double = 10.0
    var isValid: Bool = false
    var validDays: Int = 7
    
    // Constructor for the Coupon Object
    init(start: Date, end: Date, couponAmount: Double) {
        super.init()
        self.startDate = start
        self.endDate = end
        self.amount = couponAmount
        self.validateCoupon()
    }
    
    // Validate the Coupon
    public func validateCoupon() {
        // Make sure the coupon is 10.00 or less
        if self.amount > 10.0 {
            // return right away with isValid still false
            return
        }
        // Unwrap the start and end dates
        guard let start = self.startDate, let end = self.endDate else {
            return
        }
        // Calculate the start and end dates
        guard let dayDifference = Calendar.current.dateComponents([.day], from: start, to: end).day,
            dayDifference <= validDays else {
            // return right away with isValid still false
            return
        }
        // Make sure that isValid is set to true once all fields have been validated
        self.isValid = true
    }
    
}

// Test our Coupon Object with a XCTestCase
class CouponTest: XCTestCase {
    
    let dateNow = Date()
    
    override func setUp() {
        super.setUp()
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
    
    override func tearDown() {
        super.tearDown()
    }
}
