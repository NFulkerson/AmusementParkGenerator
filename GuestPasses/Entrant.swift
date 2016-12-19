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
    
    init() {
        
    }
    
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
    var type: EmployeeType { get }
}

enum EmployeeType {
    case FoodServices
    case RideServices
    case Maintenance
    case Manager
}

// This protocol is the base for guests.
protocol Guest {
    var type: GuestType { get }
}

enum GuestType {
    case classic
    case vip
    case freeChild
}

/// This protocol defines personally identifiable information such as name and address.
protocol Addressable {
    var firstName: String { get }
    var lastName: String { get }
    var address: HomeAddress { get }
}

/// This protocol defines free admittance to the park.
protocol FreelyAdmissible {
    var birthDate: Date { get }
}

protocol RideAccessible {
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
