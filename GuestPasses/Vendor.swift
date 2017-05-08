//
//  Vendor.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 4/6/17.
//  Copyright © 2017 Nathan Fulkerson. All rights reserved.
//

import Foundation

struct Vendor: Entrant, Addressable {
    let name: Name
    let address: HomeAddress
    let company: VendorCompany
    
    enum VendorCompany {
        case acme, orkin, fedex, nwElectrical
    }
}