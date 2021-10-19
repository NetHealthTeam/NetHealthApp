//
//  FilledButton.swift
//  NetHealth
//
//  Created by Anday on 18.10.21.
//

import SwiftUI

struct FilledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 42)
            .background(Color.accentColor.cornerRadius(8))
    }
}

struct FilledButton_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            
        } label: {
            Text("Hello")
        }
        .buttonStyle(FilledButtonStyle())
        .previewLayout(.sizeThatFits)
        .padding()

    }
}
