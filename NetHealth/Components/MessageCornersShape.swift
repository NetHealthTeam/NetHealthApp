//
//  MessageCornersShape.swift
//  NetHealth
//
//  Created by Anday on 25.11.21.
//

import SwiftUI

struct MessageCornersShape: Shape {
    var isUserMessage: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, isUserMessage ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
        
        return Path(path.cgPath)
    }
}
