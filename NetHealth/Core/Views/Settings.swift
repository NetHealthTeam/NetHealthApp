//
//  Settings.swift
//  NetHealth
//
//  Created by Anday on 31.10.21.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Julia Mario")
                .font(.title)
                .bold()
                .foregroundColor(.accentColor)
            Text("juliamario@gmail.com")
                .font(.caption)
                .foregroundColor(.accentColor)
            SettingsButton(icon: "person.fill", title: "Account")
            SettingsButton(icon: "bell.fill", title: "Notification")
            SettingsButton(icon: "eye.fill", title: "Appearance")
            SettingsButton(icon: "checkerboard.shield", title: "Privacy & Security")
            SettingsButton(icon: "globe.americas.fill", title: "Language")
            
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
        }
    }
}


struct SettingsButton: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.headline)
                .padding(.trailing)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                
        }
        .foregroundColor(.accentColor.opacity(0.8))
        .padding(.horizontal)
    }
}
