//
//  Home.swift
//  NetHealth
//
//  Created by Anday on 15.11.21.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var userSettings: UserSettings
    var body: some View {
        NavigationView {
            VStack {
                Text("👋🏻 Hi \(userSettings.currentUser?.fullName ?? "") !")
                    .font(.title)
                    .bold()
                    .foregroundColor(.accentColor)
                Spacer()
                ScrollView(showsIndicators: false) {
                    NavigationLink(destination: Diet().toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("🍳 Daily Diet Plan!")
                                .font(.title)
                                .bold()
                                .foregroundColor(.accentColor)
                        }
                    }) {
                        MenuItem(title: "Your Diet", imageName: "Stomach_diet")
                    }
                    .padding()
                }
            }
            .navigationTitle("Home")
            .navigationBarHidden(true)
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettings())
    }
}
