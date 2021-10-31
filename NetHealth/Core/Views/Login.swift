//
//  Login.swift
//  NetHealth
//
//  Created by Anday on 18.10.21.
//

import SwiftUI

struct Login: View {
    @State private var input: String = ""
    var body: some View {
        VStack {
            LoginHeaderView(h1Text: "Login", h2Text: "Welcome Back")
                .padding()
            Spacer()
            Image("Welcome")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            Spacer()
            
            
            // Inputs
            VStack {
                TextField("Email", text: $input)
                    .NHTextFieldStyle()
                    .padding(.bottom, 8)
                
                SecureField("Password", text: $input)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.accentColor.opacity(0.2), lineWidth: 1)
                    )
            }
            
            // Forgot Password?
            HStack {
                Spacer()
                Text("Forgot Password?")
                    .font(.callout)
                    .foregroundColor(.accentColor)
            }
            
            
            
            
            Button(action: {
                
            }, label: {
                Text("Login")
                
            })
                .buttonStyle(FilledButtonStyle())
                .padding(.vertical, 24)
            
            
            
            // Don't have an account? Sign Up
            HStack {
                Text("Don't have an account?")
                    .font(.callout)
                    .foregroundColor(.accentColor.opacity(0.6))
                NavigationLink(destination: Signup()
                                .navigationBarHidden(true)) {
                    Text("Sign Up")
                        .font(.callout)
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
