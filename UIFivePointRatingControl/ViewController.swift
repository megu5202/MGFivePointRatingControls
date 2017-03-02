//
//  ViewController.swift
//  UIFivePointRatingControl
//
//  Created by Melissa Guba on 2/28/17.
//  Copyright © 2017 Melissa Guba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rating = FivePointRating(initialValue: 3.0, editable: true)
        view.addSubview(rating)
        
        rating.widthAnchor.constraint(equalToConstant: rating.frame.width).isActive = true
        rating.heightAnchor.constraint(equalToConstant: rating.frame.height).isActive = true
        rating.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        rating.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

