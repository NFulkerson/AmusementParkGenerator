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
        return true
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

struct Guest: Entrant {
    var type: GuestType
    
    enum GuestType {
        case classic
        case vip
        case freeChild
    }
}

struct Employee: Entrant, Employable {
    let name: Name
    let address: HomeAddress
    var type: EmployeeType
    func swipe() -> Bool {
        return true
    }
}

struct Baby: Entrant, FreelyAdmissible {
    var birthDate: Date
}

/// This protocol defines personally identifiable information such as name and address.
protocol Addressable {
    var name: Name { get }
    var address: HomeAddress { get }
}



