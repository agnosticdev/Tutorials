//
//  Coupon.swift
//  XCTestTest
//
//  Created by Matt Eaton on 6/25/18.
//  Copyright © 2018 Matt Eaton. All rights reserved.
//

import Foundation

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
