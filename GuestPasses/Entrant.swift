//
//  Entrant.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 12/12/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import Foundation

typealias PercentDiscount = Float

// We'll define entrant as a class as, 
// a) Entrants are unique individuals. They cannot be 'copies' of one another.
// b ) We want to verify whether a particular entry pass has been swiped in quick succession at the same ride.
// Checking such a thing would be tricky or impossible with value types.

struct Person {

}

protocol Entrant: RideAccessible {
    func swipe() -> Bool
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

struct Guest {
    var type: GuestType
    
    enum GuestType {
        case classic
        case vip
        case freeChild
    }
}

/// This protocol defines personally identifiable information such as name and address.
protocol Addressable {
    var name: Name { get }
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

struct Name {
    let first: String
    let middle: String?
    let last: String
    var full: String {
        guard let middle = middle else { return "\(first) \(last)" }
        return "\(first) \(middle) \(last)"
    }
}

struct HomeAddress {
    let streetAddress: String
    let city: String
    let state: String
    let zipCode: Int
}
