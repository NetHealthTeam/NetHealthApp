//
//  ToolbarWithTitle.swift
//  NetHealth
//
//  Created by Anday on 23.11.21.
//

import SwiftUI

struct ToolbarWithTitle: ViewModifier {
    var title: String
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.title)
                        .bold()
                        .foregroundColor(.accentColor)
                }
            }
    }
}
