//
//  FivePointRating.swift
//  UIFivePointRatingControl
//
//  Created by Melissa Guba on 3/1/17.
//  Copyright © 2017 Melissa Guba. All rights reserved.
//

import Foundation
import UIKit

final class FivePointRating: UIControl {
    
    private var editable: Bool = false
    private var value: Float = 0.0
    private var buttons: [UIButton]!
    
    private var selectedImage: UIImage!
    private var deselectedImage: UIImage!
    private var imageSpacing: CGFloat!
    private var imageDimension: CGFloat!
    
    convenience init(initialValue: Float, editable: Bool) {
        /* Customize the size */
        let imageSpacing: CGFloat = 10.0
        let imageDimension: CGFloat = 40.0
        
        let frame = CGRect(x: 0.0, y: 0.0, width: (imageDimension * 5) + (imageSpacing * 4), height: imageDimension)
        self.init(frame: frame)
        self.imageSpacing = imageSpacing
        self.imageDimension = imageDimension
        
        /* Customize the images */
        self.selectedImage = #imageLiteral(resourceName: "darkStar")
        self.deselectedImage = #imageLiteral(resourceName: "lightStar")
        
        self.editable = editable
        self.value = initialValue
        self.instantiateButtons()
    }
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func instantiateButtons() {
        let buttonSize = CGSize(width: imageDimension, height: imageDimension)
        let y: CGFloat = 0.0
        
        var buttons: [UIButton] = []
        for index in 0...4 {
            let origin = CGPoint(x: ((buttonSize.width + imageSpacing) * CGFloat(index)), y: y)
            let button = UIButton(frame: CGRect(origin: origin, size: buttonSize))
            button.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
            button.adjustsImageWhenHighlighted = false
            button.setImage(deselectedImage, for: .normal)
            button.setImage(deselectedImage, for: .highlighted)
            button.setImage(selectedImage, for: .selected)
            button.setImage(selectedImage, for: [.selected, .highlighted])
            
            button.isEnabled = editable
            
            addSubview(button)
            buttons.append(button)
        }
        
        self.buttons = buttons
        updateButtonStates()
    }
    
    @objc private func buttonTapped(sender: UIButton) {
        guard let tappedIndex = buttons.index(of: sender) else { return }
        value = Float(tappedIndex) + 1
        updateButtonStates()
    }
    
    private func updateButtonStates() {
        let value = Int(self.value)
        let buttonsToSelect = buttons[0..<value]
        let buttonsToDeselect = buttons[value..<5]
        
        buttonsToSelect.forEach { $0.isSelected = true }
        buttonsToDeselect.forEach { $0.isSelected = false }
    }
}
