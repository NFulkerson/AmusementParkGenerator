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
        print("Hello thar")
        setupViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews() {
        let button1 = UIButton(type: .roundedRect)
        let button2 = UIButton(type: .roundedRect)
        button1.backgroundColor = .blue
        button2.backgroundColor = .red
        let stackView = UIStackView(arrangedSubviews: [button1,button2])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0.0),
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0.0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0)
        ])
    }
    
    
}
