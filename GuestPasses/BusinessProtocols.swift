//
//  BusinessProtocols.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 1/15/17.
//  Copyright © 2017 Nathan Fulkerson. All rights reserved.
//

import Foundation

/// This protocol defines free admittance to the park.
protocol FreelyAdmissible {
    // requires a birthdate, which we can check further to verify whether an entrant qualifies.
    var birthDate: Date { get }
}

// MARK: - Ride Privileges

protocol RideAccessible {
}

protocol LineSkippable {
}

// MARK: - Location Access

protocol AmusementAccessible {
}

protocol KitchenAccessible {
}

protocol RideControlAccessible {
}

protocol MaintenanceAccessible {
}

protocol OfficeAccessible {
}
