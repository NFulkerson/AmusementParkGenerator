//
//  EntryError.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 12/22/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import Foundation

enum NameError: Error {
    case firstNameMissing
    case lastNameMissing
}

enum AddressError: Error {
    case zipCodeInvalid
    case zipCodeMissing
    case streetAddressMissing
    case cityMissing
    case cityInvalid
    case stateMissing
    case stateInvalid
}

enum DOBError: Error {
    case dobInvalid(String) // Whether too old or too young for the relevant entry,
    // we can throw this error and pass along a relevant message,
    // eg: "Too old for free child entry." "Too young to qualify for Senior Pass."
}

enum AccessError: Error {
    case EntryNotPermitted
}

