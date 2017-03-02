//
//  FivePointRating.swift
//  UIFivePointRatingControl
//
//  Created by Melissa Guba on 2/28/17.
//  Copyright © 2017 Melissa Guba. All rights reserved.
//

import Foundation
import UIKit

final class BrokenFivePointRating: UIControl {
    
    typealias Action = () -> Void
    
    private var value: Float!
    private var selectedImage: UIImage!
    private var deselectedImage: UIImage!
    
//    private var editable: Bool!
//    private var valueChangedAction: Action?
    
    var button1: UIButton!
    private var button2: UIButton!
    private var button3: UIButton!
    private var button4: UIButton!
    private var button5: UIButton!
    
    private var buttons: [UIButton]!
    
    convenience init(selectedImage: UIImage, deselectedImage: UIImage, initialValue: Float? = 0.0, /*editable: Bool? = false,*/ valueChangedAction: Action? = nil) {
        let frame = CGRect(x: 0.0, y: 0.0, width: ((20.0 * 5) + (10.0 * 4)), height: 20.0)
        self.init(frame: frame)
        
        self.value = initialValue
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
        backgroundColor = UIColor.cyan
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func addButtons() {
        let buttonSize = CGSize(width: 20.0, height: 20.0)
        let origin1 = CGPoint(x: 0.0, y: 0.0)
        let origin2 = CGPoint(x: 30.0, y: 0.0)
        let origin3 = CGPoint(x: 60.0, y: 0.0)
        let origin4 = CGPoint(x: 90.0, y: 0.0)
        let origin5 = CGPoint(x: 120.0, y: 0.0)
        
        button1 = UIButton(frame: CGRect(origin: origin1, size: buttonSize))
        button1.addTarget(self, action: #selector(tapAction), for: .touchDown)
        addSubview(button1)
//        button1.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        button1.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        button2 = UIButton(frame: CGRect(origin: origin2, size: buttonSize))
        addSubview(button2)
//        button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: buttonSpacing).isActive = true
//        button2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        button3 = UIButton(frame: CGRect(origin: origin3, size: buttonSize))
        addSubview(button3)
//        button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: buttonSpacing).isActive = true
//        button3.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        button4 = UIButton(frame: CGRect(origin: origin4, size: buttonSize))
        addSubview(button4)
//        button4.leadingAnchor.constraint(equalTo: button3.trailingAnchor, constant: buttonSpacing).isActive = true
//        button4.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        button5 = UIButton(frame: CGRect(origin: origin5, size: buttonSize))
        addSubview(button5)
//        button5.leadingAnchor.constraint(equalTo: button4.trailingAnchor, constant: buttonSpacing).isActive = true
//        button5.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        buttons = [button1, button2, button3, button4, button5]
    }
    
    private func formatButtons() {
        buttons.forEach { button in
            button.backgroundColor = UIColor.red
            button.isEnabled = true
            button.adjustsImageWhenHighlighted = true
            
            button.setImage(selectedImage, for: .highlighted)
            button.setImage(deselectedImage, for: .normal)
            button.setImage(selectedImage, for: .selected)
            
//            button.addTarget(self, action: #selector(tapAction), for: .touchDown)
        }
    }
    
    private func updateButtonStates() {
        let buttonValue = Int(value)
        let buttonsToSelect = buttons[0..<buttonValue]
        let buttonsToDeselect = buttons[buttonValue..<5]
        
        buttonsToSelect.forEach { $0.isSelected = true }
        buttonsToDeselect.forEach { $0.isSelected = false }
    }
    
    func onValueChanged() {
        
    }
    
    override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        //do shit
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("do stuff")
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        print("do stuff")
        return true
    }
    
    @objc private func tapAction() {
//        valueChangedAction?()
    }
}
