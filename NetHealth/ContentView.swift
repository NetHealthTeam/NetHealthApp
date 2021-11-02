//
//  ContentView.swift
//  NetHealth
//
//  Created by Anday on 16.10.21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userSettingsStorage: UserSettings = UserSettings()
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(.accentColor)]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(.accentColor)]
    }
    var body: some View {
        NavigationView {
            if userSettingsStorage.token.isEmpty {
                Welcome()
                    .navigationTitle("Welcome")
                    .navigationBarHidden(true)
            }
            else {
                Settings()
                    .navigationTitle("Settings")
            }
        }
        .environmentObject(userSettingsStorage)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
