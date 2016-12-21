//
//  Entrant.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 12/12/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import Foundation

typealias PercentDiscount = Float

// MARK: - Entrant Types

struct Person {
}

protocol Entrant: RideAccessible {
    func swipe(location: KioskLocation) -> Bool
}

extension Entrant {
    func swipe(location: KioskLocation) -> Bool {
        /// TODO: Implement
        return false
    }
}

enum KioskError: Error {
    case AccessPointNotFound
}

struct Employee: Employable, Entrant {
    let name: Name
    var address: HomeAddress
    let type: EmployeeType
    
    init(name: Name, address: HomeAddress, type: EmployeeType) {
        self.name = name
        self.address = address
        self.type = type
    }
}

// This protocol is the base for all employees.
protocol Employable: Addressable {
    var type: EmployeeType { get }
    
    init(name: Name, address: HomeAddress, type: EmployeeType)
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

struct Baby: FreelyAdmissible {
    var birthDate: Date
}



// Indicates the point where a passcard may be swiped
enum KioskLocation {
    case Amusement
    case Kitchen
    case RideControl
    case Maintenance
    case Office
    case Restaurant
    case MerchBooth
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

/// MARK: - Helper Structs

struct Name {
    let first: String
    let middle: String?
    let last: String
    var full: String {
        guard let middle = middle else { return "\(first) \(last)" }
        return "\(first) \(middle) \(last)"
    }
    
    init(first: String, last: String) {
        self.first = first
        self.middle = nil
        self.last = last
    }
}

struct HomeAddress {
    let streetAddress: String
    let city: String
    let state: String
    let zipCode: Int
}

/// MARK: - Test Outputs


let fry = Employee(name: Name(first: "Philip", last: "Fry"), address: HomeAddress(streetAddress: "Blah", city: "New New York", state: "NY", zipCode: 61463), type: .FoodServices)

fry.name.full

let maggie = Baby(birthDate: Date(timeIntervalSince1970: 629625600))

maggie.birthDate


fry.swipe(location: .Amusement)
