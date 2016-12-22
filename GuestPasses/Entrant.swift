//
//  Entrant.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 12/12/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import Foundation

typealias PercentDiscount = Float

struct Person {
}

protocol Entrant {
    func swipe() -> Bool
}

extension Entrant {
    // TODO: Implement swipe functionality
    func swipe() -> Bool {
        return false
    }
}

// MARK: Guest - Classic, VIP, Child
struct Guest {
    var type: GuestType
    
    enum GuestType {
        case classic
        case vip
        case freeChild
    }
    
    init() {
        self.type = .classic
    }
}

// MARK: Hourly Employee, Manager

struct Employee: Entrant, Employable {
    
    var name: Name
    var address: HomeAddress
    var type: EmployeeType
    
    enum EmployeeType {
        case FoodServices
        case RideServices
        case Maintenance
        case Manager
    }
    
    init(name: Name, address: HomeAddress, type: Employee.EmployeeType) {
        self.name = name
        self.address = address
        self.type = type
    }
    
    init(with firstName: String, middleName: String?, lastName: String, address: HomeAddress, type: EmployeeType) {
        let name = Name(first: firstName, middle: middleName, last: lastName)
        self.init(name: name, address: address, type: type)
    }
}

protocol Employable: Addressable {
    init(name: Name, address: HomeAddress, type: Employee.EmployeeType)
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

// MARK: Helpers
struct Name {
    let first: String
    let middle: String?
    let last: String
    var full: String {
        guard let middle = middle else { return "\(first) \(last)" }
        return "\(first) \(middle) \(last)"
    }
    
    init(first: String, middle: String?, last: String) {
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

struct HomeAddress {
    let streetAddress: String
    let city: String
    let state: String
    let zipCode: Int
}

