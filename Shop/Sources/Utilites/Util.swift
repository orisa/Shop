//
//  Util.swift
//  Shop
//
//  Created by Admin on 10/12/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//

import Foundation
import SwiftUI


struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
}
