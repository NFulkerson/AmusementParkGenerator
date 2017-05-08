//
//  Guest.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 3/24/17.
//  Copyright © 2017 Nathan Fulkerson. All rights reserved.
//

import Foundation

struct Guest: Entrant, RideAccessible, DiscountQualifiable {
    var type: GuestType
    enum GuestType {
        case classic
        case vip
    }
    var discounts: (food: PercentDiscount, merch: PercentDiscount) {
        switch self.type {
        // This could still be handled better.
        case .classic:
            return (food: 0.0, merch: 0.0)
        case .vip:
            return (food: 0.10, merch: 0.20)
        }
    }
}
