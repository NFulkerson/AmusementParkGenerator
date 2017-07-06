//
//  EntrantFormViewController.swift
//  GuestPasses
//
//  Created by Nathan Fulkerson on 3/23/17.
//  Copyright © 2017 Nathan Fulkerson. All rights reserved.
//
// Entrant Form View is an implementation of Screen Mockup 1.

import UIKit

class EntrantFormViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews() {
        let stackBgView = UIView()
        stackBgView.backgroundColor = UIColor.CustomColor.Purple.light
        let entrantStack = createMenu()
        stackBgView.addSubview(entrantStack)
        let button2 = UIButton(type: .roundedRect)
        button2.backgroundColor = UIColor.CustomColor.Purple.dark
        let stackView = UIStackView(arrangedSubviews: [stackBgView,button2])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            entrantStack.bottomAnchor.constraint(equalTo: stackBgView.layoutMarginsGuide.bottomAnchor, constant: 0.0),
            entrantStack.topAnchor.constraint(equalTo: stackBgView.layoutMarginsGuide.topAnchor, constant: 0.0),
            entrantStack.trailingAnchor.constraint(equalTo: stackBgView.layoutMarginsGuide.trailingAnchor, constant: 0.0),
            entrantStack.leadingAnchor.constraint(equalTo: stackBgView.layoutMarginsGuide.leadingAnchor, constant: 0.0),
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 150.0),
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0.0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0)
        ])
    }
    
    func createMenu() -> UIStackView {
        let guestButton = UIButton(type: .custom)
        guestButton.setTitle("Guest", for: .normal)
        guestButton.setTitleColor(.white, for: .normal)
        guestButton.backgroundColor = .clear
        
        let employeeButton = UIButton(type: .custom)
        employeeButton.setTitle("Employee", for: .normal)
        employeeButton.setTitleColor(.white, for: .normal)
        employeeButton.backgroundColor = .clear
        
        let managerButton = UIButton(type: .custom)
        managerButton.setTitle("Manager", for: .normal)
        managerButton.setTitleColor(.white, for: .normal)
        managerButton.backgroundColor = .clear
        
        let vendorButton = UIButton(type: .custom)
        vendorButton.setTitle("Vendor", for: .normal)
        vendorButton.setTitleColor(.white, for: .normal)
        vendorButton.backgroundColor = .clear
        
        let entrantStack = UIStackView(arrangedSubviews: [guestButton, employeeButton, managerButton, vendorButton])
        entrantStack.axis = .horizontal
        entrantStack.distribution = .equalSpacing
        entrantStack.alignment = .center
        entrantStack.translatesAutoresizingMaskIntoConstraints = false
        
        return entrantStack
    }
    
    func createSubMenu() -> UIStackView {
        let childButton = UIButton(type: .custom)
        childButton.setTitleColor(.white, for: .normal)
        childButton.setTitle("Child", for: .normal)
        
        let adultButton = UIButton(type: .custom)
        adultButton.setTitle("Adult", for: .normal)
        adultButton.setTitleColor(.white, for: .normal)
        
        let vipButton = UIButton(type: .custom)
        vipButton.setTitleColor(.white, for: .normal)
        vipButton.setTitle("VIP", for: .normal)
        
        let seniorButton = UIButton(type: .custom)
        seniorButton.setTitleColor(.white, for: .normal)
        seniorButton.setTitle("Senior", for: .normal)
        
        let subStack = UIStackView(arrangedSubviews: [childButton, adultButton, seniorButton, vipButton])
        subStack.axis = .horizontal
        subStack.distribution = .equalSpacing
        subStack.alignment = .center
        subStack.translatesAutoresizingMaskIntoConstraints = false
        
        return subStack
        
    }
    
    
}
