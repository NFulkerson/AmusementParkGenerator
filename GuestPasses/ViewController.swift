//
//  ViewController.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 12/12/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rooms = AccessControlList().rooms
        let guest = Guest(type: .vip)
//       let guest = Guest(type: .classic)
//       let guest = createValidEmployee(type: .FoodServices)
//       let guest = createValidEmployee(type: .Maintenance)
//       let guest = createValidEmployee(type: .RideServices)
//       let guest = createValidEmployee(type: .Manager)
        // will throw a name error
//       let guest = createInvalidEmployee(type: .FoodServices)
        // will throw an address error
//        let guest = createInvalidEmployee(type: .Manager)
        // too old
//        let date = "1989-05-19"
        // not born
//        let date = "2019-01-01"
        // valid
//        let date = "2016-03-14"
//        do {
//           let guest = try FreeChild(birthDate: date)
//            checkPermissions(for: guest, in: rooms)
//        } catch let error as DOBError {
//            print(error)
//        } catch let error {
//            print(error)
//        }

        // MARK: - for optional types
//        guard let pass = guest else {
//            print("This guest couldn't be tested. Check for errors.")
//            return
//        }
//         checkPermissions(for: pass, in: rooms)
//
        // MARK: - For non-optionals
        checkPermissions(for: guest, in: rooms)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkPermissions(for entrant: Entrant, in rooms: [Kiosk]) {
        for kiosk in rooms {
            print("Swiping access for \(kiosk.location)")
            print(entrant.swipe(kiosk: kiosk))
        }
    }
    
    // Plug Helpers, temporary. Cut down on messy dos-and-tries when trying to test.
    
    /// Creates an Employee pass of the specified type.
    ///
    /// - Parameter type: EmployeeType
    /// - Returns: Employee
    func createValidEmployee(type: EmployeeType) -> Employee? {
        guard let employee = try? Employee(as: type) else {
            return nil
        }
        return employee
    }
    
    func createInvalidEmployee(type: EmployeeType) -> Employee? {
        guard let employee = try? Employee(as: type, valid: false) else {
            return nil
        }
        return employee
    }

}

