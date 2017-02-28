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
    
    var value: Float!
    
    typealias Action = () -> Void
    
    private var selectedImage: UIImage!
    private var deselectedImage: UIImage!
    
    private var editable: Bool!
    private var valueChangedAction: Action?
    
    private var imageView1: UIImageView!
    private var imageView2: UIImageView!
    private var imageView3: UIImageView!
    private var imageView4: UIImageView!
    private var imageView5: UIImageView!
    
    convenience init(selectedImage: UIImage, deselectedImage: UIImage, initialValue: Float? = 0.0, editable: Bool? = false, valueChangedAction: Action? = nil) {
        let frame = CGRect(x: 0.0, y: 0.0, width: ((20.0 * 5) + (10.0 * 4)), height: 20.0)
        self.init(frame: frame)
        
        self.value = initialValue
        self.editable = editable
        self.valueChangedAction = valueChangedAction
        self.selectedImage = selectedImage
        self.deselectedImage = deselectedImage
        
        self.formatView()
    }
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func formatView() {
        isUserInteractionEnabled = editable
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10.0
        stackView.backgroundColor = UIColor.cyan
        stackView.isUserInteractionEnabled = true
        addSubview(stackView)
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        stackView.addGestureRecognizer(tapGesture)
        
        imageView1 = UIImageView(image: deselectedImage, highlightedImage: selectedImage)
        imageView1.isUserInteractionEnabled = true
        imageView2 = UIImageView(image: deselectedImage, highlightedImage: selectedImage)
        imageView3 = UIImageView(image: deselectedImage, highlightedImage: selectedImage)
        imageView4 = UIImageView(image: deselectedImage, highlightedImage: selectedImage)
        imageView5 = UIImageView(image: deselectedImage, highlightedImage: selectedImage)
        
        stackView.addArrangedSubview(imageView1)
        stackView.addArrangedSubview(imageView2)
        stackView.addArrangedSubview(imageView3)
        stackView.addArrangedSubview(imageView4)
        stackView.addArrangedSubview(imageView5)
    }
    
    @objc private func tapAction() {
        valueChangedAction?()
    }
}
