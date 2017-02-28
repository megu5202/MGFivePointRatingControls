//
//  FivePointRating.swift
//  UIFivePointRatingControl
//
//  Created by Melissa Guba on 2/28/17.
//  Copyright © 2017 Melissa Guba. All rights reserved.
//

import Foundation
import UIKit

final class FivePointRating: UIControl {
    
    typealias Action = () -> Void
    
    private var value: Float!
    private var selectedImage: UIImage!
    private var deselectedImage: UIImage!
    
//    private var editable: Bool!
//    private var valueChangedAction: Action?
    
    private var button1: UIButton!
    private var button2: UIButton!
    private var button3: UIButton!
    private var button4: UIButton!
    private var button5: UIButton!
    private var buttons: [UIButton]!
    
    convenience init(selectedImage: UIImage, deselectedImage: UIImage, initialValue: Float? = 0.0/*, editable: Bool? = false, valueChangedAction: Action? = nil*/) {
        let frame = CGRect(x: 0.0, y: 0.0, width: ((20.0 * 5) + (10.0 * 4)), height: 20.0)
        self.init(frame: frame)
        
        self.value = initialValue
//        self.editable = editable
//        self.valueChangedAction = valueChangedAction
        self.selectedImage = selectedImage
        self.deselectedImage = deselectedImage
        
        self.addButtons()
        self.formatButtons()
        self.updateButtonStates()
    }
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func addButtons() {
        let buttonSpacing: CGFloat = 10.0
        let buttonFrame = CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0)
        
        button1 = UIButton(frame: buttonFrame)
        button1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button1)
        button1.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button1.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        button2 = UIButton(frame: buttonFrame)
        addSubview(button2)
        button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: buttonSpacing).isActive = true
        button2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        button3 = UIButton(frame: buttonFrame)
        addSubview(button3)
        button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: buttonSpacing).isActive = true
        button3.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        button4 = UIButton(frame: buttonFrame)
        addSubview(button4)
        button4.leadingAnchor.constraint(equalTo: button3.trailingAnchor, constant: buttonSpacing).isActive = true
        button4.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        button5 = UIButton(frame: buttonFrame)
        addSubview(button5)
        button5.leadingAnchor.constraint(equalTo: button4.trailingAnchor, constant: buttonSpacing).isActive = true
        button5.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        buttons = [button1, button2, button3, button4, button5]
    }
    
    private func formatButtons() {
        buttons.forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
            button.adjustsImageWhenHighlighted = true
            button.setImage(selectedImage, for: .highlighted)
            button.setImage(deselectedImage, for: .normal)
            button.setImage(selectedImage, for: .selected)
        }
    }
    
    private func updateButtonStates() {
        let buttonValue = Int(value)
        let buttonsToSelect = buttons[0..<buttonValue]
        let buttonsToDeselect = buttons[buttonValue..<5]
        
        buttonsToSelect.forEach { $0.isSelected = true }
        buttonsToDeselect.forEach { $0.isSelected = false }
    }
    
//    @objc private func tapAction() {
//        valueChangedAction?()
//    }
}
