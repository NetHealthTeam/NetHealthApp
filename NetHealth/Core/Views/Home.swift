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
                    NavigationLink(destination: Diet().toolbarWithTitle(title: "🍳 Daily Diet Plan!")) {
                        MenuItem(title: "Your Diet", imageName: "Stomach_diet")
                    }
                    .frame(height: 150)
                    .padding()
                    
                    NavigationLink(destination: Weekdays().toolbarWithTitle(title: "🙃 Choose the Weekday")) {
                        MenuItem(title: "Your Workout", imageName: "Workout2")
                    }
                    .frame(height: 150)
                    .padding([.horizontal, .bottom])
                }
            }
            .navigationTitle("Home")
            .navigationBarHidden(true)
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(UserSettings())
    }
}
