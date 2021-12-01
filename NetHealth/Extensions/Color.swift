//
//  Color.swift
//  NetHealth
//
//  Created by Anday on 31.10.21.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}


struct ColorTheme {
    let primary = Color("PrimaryColor")
    let main = Color("MainColor")
    let messageSent = Color("MessageSent")
    let messageReceived = Color("MessageReceived")
}
