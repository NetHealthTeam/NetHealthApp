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
            if userSettingsStorage.token.isEmpty {
                NavigationView {
                Welcome()
                    .navigationTitle("Welcome")
                    .navigationBarHidden(true)
                }
                .environmentObject(userSettingsStorage)
                
            }
            else {
                TabView {
                    Home()
                        .navigationTitle("Home")
                        .navigationBarHidden(true)
                        .tabItem {
                            Image(systemName: "house.fill")
                        }
                    
                    Chat()
                        .navigationTitle("Chat Bot")
                        .navigationBarHidden(true)
                        .tabItem {
                            Image(systemName: "message.fill")
                        }
                    
                    Settings()
                        .navigationTitle("Settings")
                        .tabItem {
                            Image(systemName: "gearshape.fill")
                        }
                }
                .environmentObject(userSettingsStorage)
            
        }

    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
