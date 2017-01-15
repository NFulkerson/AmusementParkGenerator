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
        // Do any additional setup after loading the view, typically from a nib.
        let maggie = Baby(birthDate: Date(timeIntervalSinceNow: TimeInterval(exactly: -25000000.00)!))
        if maggie as Entrant is FreelyAdmissible {
            print("Of course she is")
        } else {
            print("This won't happen")
        }
        
        if maggie as Entrant is Employable {
            print("We employ babies now.")
        } else {
            print("Don't be ridiculous, we don't employ babies.")
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

