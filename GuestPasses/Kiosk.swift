//
//  Kiosk.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 12/19/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import Foundation

enum KioskLocation {
    case Amusement
    case Kitchen
    case RideControl
    case Maintenance
    case Office
    case Restaurant
    case MerchBooth
}

enum DiscountAccessibleError: Error {
    case DiscountInaccessible
}

struct AccessControlList {
    private let types: [KioskLocation] = [.Amusement, .Kitchen, .RideControl,
                                  .Maintenance, .Office, .Restaurant, .MerchBooth]
    var rooms: [Kiosk] {
        return types.map(Kiosk.init)
    }
}

struct Kiosk {
    
    var location: KioskLocation
    
    func determinePermissions(for entrant: Entrant) -> Bool {
        switch location {
        case .Amusement:
            // currently always returns true but we could
            // imagine a situation in which someone is unable to ride rides
            // so we'll leave this here.
            if entrant is Guest {
                let guest = entrant as! Guest
                if guest.type == .vip {
                    print("Guest is permitted to skip lines!")
                }
            }
            return entrant is RideAccessible
        case .Kitchen, .RideControl, .Maintenance, .Office:
            if entrant is Employee {
                let employee = entrant as! Employee
                switch employee.type {
                case .Manager:
                    // Managers are allowed access to any of these cases
                    // so we simply return true
                    return true
                case .Maintenance:
                    // These location checks are ugly, but it is seemingly the best way
                    // to check against these cases without having to repeat ourselves.
                    // However, this means we have to add more cases if this changes in any way.
                    if location != .Office {
                        return true
                    }
                case .FoodServices:
                    if location == .Kitchen {
                        return true
                    }
                case .RideServices:
                    if location == .RideControl {
                        return true
                    }
                }
            } else {
                return false
            }
        case.Restaurant, .MerchBooth:
            if entrant is DiscountQualifiable {
                print("Checking discounts.")
                // at this point we only know that our entrant is DiscountQualifiable, we don't know
                // whether they are an employee or guest, so we have to try casting them in order
                // to do more. 
                // TODO: - REFACTOR
                // This can likely be refactored -- if we put the property in an extension we should
                // be able to access it without needing to cast anything, especially since we don't
                // need anything specific to guest or employee--the discounts are calculated within the protocol/function.
                if let guest = entrant as? Guest {
                    do {
                        guard let discount = try guest.discounts.retrieveDiscounts(for: guest) else {
                            throw DiscountAccessibleError.DiscountInaccessible
                        }
                        print("Qualifies for these discounts: \(discount)")
                    } catch EntrantConversionError.UnidentifiableEntrant {
                        print("We can't identify this pass.")
                    } catch let error {
                        print(error)
                    }
                    
                } else if let employee = entrant as? Employee {
                    do {
                        guard let discount = try employee.discounts.retrieveDiscounts(for: employee) else {
                            throw DiscountAccessibleError.DiscountInaccessible
                        }
                        print("Qualifies for these discounts: \(discount)")
                    } catch EntrantConversionError.UnidentifiableEntrant {
                        print("Something is wrong.")
                    } catch let error {
                        print(error)
                    }
                }
            
                return true
            }
        }
        print("Doesn't qualify for discounts.")
        return false
    }
    
}
