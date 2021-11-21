//
//  NHTextField.swift
//  NetHealth
//
//  Created by Anday on 19.10.21.
//

import SwiftUI

struct NHTextField: ViewModifier {
    @Binding var isValid: Bool
    func body(content: Content) -> some View {
        content
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(!isValid ?
                                .red :
                                Color.accentColor.opacity(0.2), lineWidth: 1)
            )
    }
}

struct NHTextField_Previews: PreviewProvider {
    static var previews: some View {
        TextField("Email", text: .constant(""))
            .modifier(NHTextField(isValid: .constant(true)))
    }
}
