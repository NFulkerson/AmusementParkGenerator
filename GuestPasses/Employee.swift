//
//  Employee.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 3/24/17.
//  Copyright © 2017 Nathan Fulkerson. All rights reserved.
//

import Foundation

/// Employee Type
///
/// - FoodServices: Represents kitchen and restaurant staff.
/// - RideServices: Represents ride operators.
/// - Maintenance: Represents maintenance workers.
/// - Manager: Represents managerial staff.
enum EmployeeType {
    case FoodServices
    case RideServices
    case Maintenance
    case Manager
}

struct Employee: Entrant, RideAccessible, Employable, DiscountQualifiable {
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
    init(as type: EmployeeType, with name: Name, address: HomeAddress) throws {
        do {
            
            self.name = try name
            self.address = try address
            
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
