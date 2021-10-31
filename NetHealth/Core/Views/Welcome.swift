//
//  Welcome.swift
//  NetHealth
//
//  Created by Anday on 17.10.21.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        VStack {
            LoginHeaderView(h1Text: "NetHealth", h2Text: "Welcome to")
                .padding()
            Spacer()
            Image("Welcome")
            Spacer()
            VStack {
                // Sign Up Button
                NavigationLink(destination: Signup()
                                .navigationBarHidden(true),
                               label: {
                    Text("Sign Up")
                })
                    .buttonStyle(FilledButtonStyle())
                
                // Login Button
                NavigationLink(destination: Login()
                                .navigationBarHidden(true)
                ) {
                    Text("Login")
                }
                .buttonStyle(EmptyButtonStyle())
            }
            Spacer()
            
        }
        .padding(.horizontal, 24)
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
