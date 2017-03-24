//
//  Employee.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 3/24/17.
//  Copyright © 2017 Nathan Fulkerson. All rights reserved.
//

import Foundation

enum EmployeeType {
    case FoodServices
    case RideServices
    case Maintenance
    case Manager
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
    
    /// Convenience Init
    ///
    /// - Parameters:
    ///   - type: The type of employee (Food Service, Ride Service, Management, Maintenance)
    ///   - valid: Determines whether valid or invalid plug values are used. Defaults to true. Will throw error if false.
    init(as type: EmployeeType, valid: Bool = true) throws {
        do {
            switch valid {
            case false:
                switch type {
                // helper for plug values.
                case .FoodServices, .Maintenance, .RideServices:
                    self.name = try Name(first: "", last: "Fry")
                    self.address = try HomeAddress(street: "123 Bork Drive", city: "New New York", state: "NY")
                case .Manager:
                    self.name = try Name(first: "Philip", last: "Fry")
                    self.address = try HomeAddress(street: "123 Bork Drive", city: "", state: "NY")
                }
                
            default:
                self.name = try Name(first: "Philip", last: "Fry")
                self.address = try HomeAddress(street: "123 Bork Drive", city: "New New York", state: "NY")
            }
            
        } catch let error as Name.NameError {
            print(error)
            throw error
        } catch let error as HomeAddress.AddressError {
            print(error)
            throw error
        } catch let error {
            print(error)
            throw error
        }
        
        self.type = type
        
    }
}
