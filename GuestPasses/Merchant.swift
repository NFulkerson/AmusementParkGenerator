//
//  Merchant.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 12/19/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import Foundation

// Very light-weight implementation of a merchant for testing discounts.

protocol Purchasable {
    var items: [Item] { get }
}

struct Item {
    var name: String
    var type: ItemType
    var price: Float
}

enum ItemType {
    case Food
    case Merchandise
}

struct Shop: Purchasable {
    var items: [Item]
}
