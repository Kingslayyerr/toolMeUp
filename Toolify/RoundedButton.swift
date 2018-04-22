//
//  RoundedButton.swift
//  Toolify
//
//  Created by Hevin Jantasmin on 4/22/18.
//  Copyright © 2018 Hevin Febryo. All rights reserved.
//

import UIKit


    @IBDesignable class MyButton: UIButton
    {
        override func layoutSubviews() {
            super.layoutSubviews()
            
            updateCornerRadius()
        }
        
        @IBInspectable var rounded: Bool = false {
            didSet {
                updateCornerRadius()
            }
        }
        
        func updateCornerRadius() {
            layer.cornerRadius = rounded ? frame.size.height / 7 : 0
        }

}
