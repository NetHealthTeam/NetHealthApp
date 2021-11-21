//
//  MenuItem.swift
//  NetHealth
//
//  Created by Anday on 15.11.21.
//

import SwiftUI

struct MenuItem: View {
    var title: String
    var imageName: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(.accentColor)
                .lineLimit(1)
                .padding(.leading)
            Spacer()
            Image(imageName)
                .padding()
        }
        .background(Color.theme.main.cornerRadius(12))
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem(title: "Your Diet", imageName: "Stomach_diet")
    }
}
