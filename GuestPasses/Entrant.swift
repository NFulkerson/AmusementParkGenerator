//
//  Entrant.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 12/12/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import Foundation

typealias PercentDiscount = Float
// All Entrants are, per the spec, able to access rides--so we make them adhere to the RideAccessible protocol
// Were this to change, we could simply remove this protocol and grant privileges to other groups
protocol Entrant: RideAccessible {
    // All entrants can swipe a pass, whether guest or employee, so swipe resides here.
    func swipe(kiosk: Kiosk) -> Bool
}
// Kiosk is a simple struct representing a place of entry or a swipeable station. This is
// what returns whether the entrant has sufficient permissions, and also represents the
// tests conducted by the pass generator.


extension Entrant {
    // TODO: Implement returned value from kiosk
    func swipe(kiosk: Kiosk) -> Bool {
        let accessGranted = kiosk.determinePermissions(for: self)
        if accessGranted {
            print("\(self): Access granted for \(kiosk.location)")
        } else {
            print("\(self): Access denied for \(kiosk.location)")
        }
        return accessGranted
    }
}

// These protocols loosely define different classes of people admitted entry to the park.
// This protocol is the base for all employees.
protocol Employable: Addressable {
    var type: EmployeeType { get }
}

enum EmployeeType {
    case FoodServices
    case RideServices
    case Maintenance
    case Manager
}

struct Guest: Entrant, DiscountQualifiable {
    var type: GuestType
    enum GuestType {
        case classic
        case vip
    }
    var discounts: (food: PercentDiscount, merch: PercentDiscount) {
        switch self.type {
        case .classic:
            return (food: 0.0, merch: 0.0)
        case .vip:
            return (food: 0.10, merch: 0.20)
        }
    }
}

struct Employee: Entrant, Employable, DiscountQualifiable {
    let name: Name
    let address: HomeAddress
    var type: EmployeeType
    var discounts: (food: PercentDiscount, merch: PercentDiscount) {
        switch self.type {
        case .FoodServices, .Maintenance, .RideServices:
            return (food: 0.15, merch: 0.25)
        case .Manager:
            return (food: 0.25, merch: 0.25)
        }
    }
}

// TODO: - Extend so we can calculate whether the baby qualifies for free entry.
struct FreeChild: Entrant, FreelyAdmissible {
    var birthDate: Date
    
    init(birthDate: String) throws {
        // Definitely not the right way to do it, but it'll do.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let bday = dateFormatter.date(from: birthDate) else {
            throw DOBError.dateConversionError("Couldn't create date from string.")
        }
        self.birthDate = bday
        if bday.age > 5 {
            throw DOBError.dobInvalid("Child is too old to qualify for free admission.")
        } else if bday.age < 0 {
            throw DOBError.dobInvalid("We don't need passes for children not born yet.")
        }
    }
}

/// This protocol defines personally identifiable information such as name and address.
protocol Addressable {
    var name: Name { get }
    var address: HomeAddress { get }
}



