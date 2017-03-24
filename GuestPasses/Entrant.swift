//
//  Entrant.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 12/12/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import Foundation

// TODO: Implement generics

typealias PercentDiscount = Float
// All Entrants are, per the spec, able to access rides--so we make them adhere to the RideAccessible protocol
// Were this to change, we could simply remove this protocol and grant privileges to other groups
protocol Entrant: RideAccessible {
    // All entrants can swipe a pass, whether guest or employee, so swipe resides here.
    func swipe(kiosk: Kiosk) -> Bool
}

extension Entrant {
    // TODO: Make a generic replacement instead?
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






