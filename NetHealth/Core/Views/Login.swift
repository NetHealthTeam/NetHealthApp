//
//  Login.swift
//  NetHealth
//
//  Created by Anday on 18.10.21.
//

import SwiftUI

struct Login: View {
    @StateObject private var vm: LoginViewModel = LoginViewModel()
    @EnvironmentObject private var userSettingsStorage: UserSettings
    
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
                TextField("Email", text: $vm.email)
                    .NHTextFieldStyle(isValid: $vm.isEmailValid)
                    .padding(.bottom, 8)
                
                SecureField("Password", text: $vm.password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(vm.isPasswordValid ? Color.accentColor.opacity(0.2) : Color.red , lineWidth: 1)
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
                vm.proceedLogin(userSettingsStorage: userSettingsStorage)
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
        .alert(vm.errorText, isPresented: $vm.showError) {
            EmptyView()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
