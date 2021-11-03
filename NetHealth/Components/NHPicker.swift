//
//  NHPicker.swift
//  NetHealth
//
//  Created by Anday on 03.11.21.
//

import SwiftUI

struct NHPicker<Content: View>: View {
    var title: String
    @Binding var selection: String
    @ViewBuilder var content: Content
    var body: some View {
        HStack {
            Text(title)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            Spacer()
            Picker(title, selection: $selection, content: {
                content
            })
            .padding()
            
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.accentColor.opacity(0.2), lineWidth: 1)
        )
    }
}

struct NHPicker_Previews: PreviewProvider {
    static var previews: some View {
        NHPicker(title: "You want to...", selection: .constant("1")) {
            Text("Loose weight")
            Text("Gain weight")
        }
    }
}
