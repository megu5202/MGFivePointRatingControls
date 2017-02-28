//
//  ViewController.swift
//  UIFivePointRatingControl
//
//  Created by Melissa Guba on 2/28/17.
//  Copyright © 2017 Melissa Guba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var starView: FivePointRating!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starView = FivePointRating(selectedImage: #imageLiteral(resourceName: "darkStar"), deselectedImage: #imageLiteral(resourceName: "lightStar"), initialValue: 2.0, editable: true, valueChangedAction: {
            print("value changed")
        })
        view.addSubview(starView)
        
        starView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        starView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

