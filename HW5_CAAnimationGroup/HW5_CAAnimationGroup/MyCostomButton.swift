//
//  MyCostomButton.swift
//  HW5_CAAnimationGroup
//
//  Created by Roman Cheremin on 23/10/2019.
//  Copyright © 2019 Roman Cheremin. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    override func point(inside: CGPoint, with: UIEvent?) -> Bool {
        
        let maxX = self.bounds.maxX + 15.0
        let maxY = self.bounds.maxY + 15.0
        let minX = self.bounds.minX - 15.0
        let minY = self.bounds.minY - 15.0
        
        if (inside.x < maxX &&
            inside.x > minX &&
            inside.y < maxY &&
            inside.y > minY)
        {
            return true
        }
        else
        {
            return false
        }
    }
}
