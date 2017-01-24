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
        case missingStreetAddress, missingState, missingCity, missingZip
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
    
    enum NameError: Error {
        case firstNameMissing
        case lastNameMissing
    }
}

// This seemed like the best compromise regarding responsibility for discounts
// It doesn't belong in Guest or Employee, as both could potentially qualify for discounts--
// but many do not. 
// It doesn't quite belong in the Kiosk either--the Kiosk's job is to read access permissions and values,
// not grant them. Perhaps should be implemented in the protocol.

struct DiscountAccess {
    
    func retrieveDiscounts(for entrant: DiscountQualifiable) throws -> (food: PercentDiscount, merchandise: PercentDiscount)? {
        if entrant is Employee {
            let employee = entrant as! Employee
            let type = employee.type
            switch type {
            case .FoodServices, .Maintenance, .RideServices:
                return (food: 0.15, merchandise: 0.25)
            case .Manager:
                return (food: 0.25, merchandise: 0.25)
            }
        } else if entrant is Guest {
            let guest = entrant as! Guest
            let type = guest.type
            switch type {
            case .vip:
                return (food: 0.10, merchandise: 0.20)
            default:
                return nil
            }
        } else {
            throw EntrantConversionError.UnidentifiableEntrant
        }
        
    }
}

extension Date {
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
}
