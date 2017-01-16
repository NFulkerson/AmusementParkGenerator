//
//  Helpers.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 1/15/17.
//  Copyright © 2017 Nathan Fulkerson. All rights reserved.
//

import Foundation

struct HomeAddress {
    let streetAddress: String
    let city: String
    let state: String
    
    init(street: String, city: String, state: String) throws {
        if street.isEmpty {
            throw AddressError.missingStreetAddress
        }
        if city.isEmpty {
            throw AddressError.missingCity
        }
        if state.isEmpty {
            throw AddressError.missingState
        }
        self.streetAddress = street
        self.city = city
        self.state = state
    }
    
    enum AddressError: Error {
        case missingStreetAddress, missingState, missingCity
    }
}

struct Name {
    let first: String
    let middle: String?
    let last: String
    var full: String {
        guard let middle = middle else { return "\(first) \(last)" }
        return "\(first) \(middle) \(last)"
    }
    init(first: String, middle: String, last: String) {
        self.first = first
        self.middle = middle
        self.last = last
    }
    init(first: String, last: String) {
        self.first = first
        self.middle = nil
        self.last = last
    }
}

struct DiscountAccess {
    var foodDiscount: PercentDiscount
    var merchandiseDiscount: PercentDiscount
}
