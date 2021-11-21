//
//  Settings.swift
//  NetHealth
//
//  Created by Anday on 31.10.21.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject private var usettings: UserSettings
    var body: some View {
        VStack(spacing: 24) {
            Text(usettings.currentUser?.fullName ?? "")
                .font(.title)
                .bold()
                .foregroundColor(.accentColor)
            Text(usettings.currentUser?.email ?? "")
                .font(.caption)
                .foregroundColor(.accentColor)
            SettingsButton(icon: "person.fill", title: "Account")
            SettingsButton(icon: "bell.fill", title: "Notification")
            SettingsButton(icon: "eye.fill", title: "Appearance")
            SettingsButton(icon: "checkerboard.shield", title: "Privacy & Security")
            SettingsButton(icon: "globe.americas.fill", title: "Language")
            SettingsButton(icon: "lock.fill", title: "Logout", destructive: true)
                .onTapGesture {
                    usettings.logout()
                }
            
            Spacer()
        }
        .padding()
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        Settings()
            .navigationTitle("Settings")
            .environmentObject(UserSettings())
        }
    }
}


struct SettingsButton: View {
    var icon: String
    var title: String
    var destructive: Bool?
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.headline)
                .padding(.trailing)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                
        }
        .foregroundColor(destructive ?? false ? .red.opacity(0.8) : .accentColor.opacity(0.8))
        .padding(.horizontal)
    }
}
