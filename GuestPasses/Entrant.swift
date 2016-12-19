//
//  Entrant.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 12/12/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import Foundation

typealias Discount = Float

// We'll define entrant as a class as, 
// a) Entrants are unique individuals. They cannot be 'copies' of one another.
// b ) We want to verify whether a particular entry pass has been swiped in quick succession at the same ride.
// Checking such a thing would be tricky or impossible with value types.

class Entrant {
    
    /// Determine whether an entrant is permitted entry to rides and park areas or discounts.
    ///
    /// - Returns: Returns true if entrant has proper permissions, else false.
    func swipe() -> Bool {
        return false
    }
    
    /// Defines invalid cases for entrants.
    ///
    /// - RequiredValueMissing: Thrown when Entrant does not supply information required by protocol or other type.
    enum EntrantError: Error {
        case RequiredValueMissing
    }
}

extension Entrant: RideAccessible {
    
}


// These protocols loosely define different classes of people admitted entry to the park.

// This protocol is the base for all employees.
protocol Employable: Addressable {
}

// This protocol is the base for guests.
protocol GuestType {
}
// This protocol is the base for managers.
protocol ManagerialType: RideControllable, KitchenAccessible, MaintenanceAccessible, OfficeAccessible  {
}

// These protocols define required data, permitted access, and other chunkable features

/// This protocol defines access to amusement areas.
protocol RideAccessible {
}
/// This protocol defines access to ride controls.
protocol RideControllable {
}
/// This protocol defines access to the kitchen areas.
protocol KitchenAccessible {
}
/// This protocol defines access to maintenance rooms.
protocol MaintenanceAccessible {
}
/// This protocol defines access to managerial offices.
protocol OfficeAccessible {
}

/// This protocol defines personally identifiable information such as name and address.
protocol Addressable {
    static var firstName: String { get }
    static var lastName: String { get }
    static var address: HomeAddress { get }
}

/// This protocol defines free admittance to the park.
protocol FreelyAdmissible {
    static var birthDate: Date { get }
}

/// This protocol defines whether an entrant is able to skip lines.
protocol Skippable {
    func skipLine()
}

struct HomeAddress {
    let streetAddress: String
    let city: String
    let state: String
    let zipCode: Int
}
