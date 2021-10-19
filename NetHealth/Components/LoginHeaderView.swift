//
//  LoginHeaderView.swift
//  NetHealth
//
//  Created by Anday on 19.10.21.
//

import SwiftUI

struct LoginHeaderView: View {
    var h1Text: String
    var h2Text: String
    var body: some View {
        VStack {
            Text(h2Text)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)

            Text(h1Text)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
                .multilineTextAlignment(.center)
        }
    }
}

struct LoginHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeaderView(h1Text: "NetHealth", h2Text: "Welcome to")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
