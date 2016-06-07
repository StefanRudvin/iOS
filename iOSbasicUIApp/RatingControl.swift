//
//  RatingControl.swift
//  iOSbasicUIApp
//
//  Created by Stefan Rudvin on 07/06/16.
//  Copyright © 2016 Stefan Rudvin. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    
    var rating = 0
    var ratingButtons = [UIButton]()

    // MARK: Initialization
    
    // Every UIView subclass needs an initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // _ is a wildcard for when it doesn't matter which iteration of the loop you are on.
        for _ in 1..<5 {
            
            let button = UIButton (frame: CGRect(x:0, y:0, width: 44, height: 44))
            button.backgroundColor = UIColor.redColor()
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            
            ratingButtons+=[button]
            addSubview(button)
        }
        
    }
    
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (44 + 5))
            button.frame = buttonFrame
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton){
        print("Button Pressed +1")
    }
    
}
