//
//  View.swift
//  NetHealth
//
//  Created by Anday on 19.10.21.
//

import Foundation
import SwiftUI

extension View {
    func NHTextFieldStyle(isValid: Binding<Bool>) -> some View {
        self.modifier(NHTextField(isValid: isValid))
    }
    
    func toolbarWithTitle(title: String) -> some View {
        self.modifier(ToolbarWithTitle(title: title))
    }
}
