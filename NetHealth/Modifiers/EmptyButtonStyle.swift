//
//  EmptyButtonStyle.swift
//  NetHealth
//
//  Created by Anday on 18.10.21.
//

import SwiftUI

struct EmptyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .foregroundColor(.accentColor)
            .frame(maxWidth: .infinity)
            .frame(height: 42)
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.accentColor, lineWidth: 1))
    }
}

struct EmptyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            
        } label: {
            Text("Login")
        }
        .buttonStyle(EmptyButtonStyle())
        .previewLayout(.sizeThatFits)
        .padding()
        
    }
}
