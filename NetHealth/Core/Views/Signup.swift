//
//  Signup.swift
//  NetHealth
//
//  Created by Anday on 25.10.21.
//

import SwiftUI

struct Signup: View {
    @StateObject private var vm: SignupViewModel = SignupViewModel()
    var body: some View {
        VStack {
            LoginHeaderView(h1Text: "Sign Up", h2Text: "Hello Beautiful")
                .padding()
            Spacer()
            Image("SignUp")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            
            // Inputs
            VStack {
                TextField("Full Name", text: $vm.fullName)
                    .NHTextFieldStyle()
                    .padding(.bottom, 8)
                
                TextField("Email", text: $vm.email)
                    .NHTextFieldStyle()
                    .padding(.bottom, 8)
                
                
                TextField("Age", text: $vm.age)
                    .keyboardType(.numberPad)
                    .NHTextFieldStyle()
                    .padding(.bottom, 8)

                Picker(selection: $vm.gender) {
                    ForEach(Gender.allCases, id: \.self) { val in
                        Text(val.rawValue).tag(val.rawValue)
                    }
                } label: {
                    HStack {
                        Text("Gender")
                        Spacer()
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.bottom, 8)
                
                
                SecureField("Password", text: $vm.password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.accentColor.opacity(0.2), lineWidth: 1)
                    )
                
                SecureField("Confirm Password", text: $vm.passwordConfirmation)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.accentColor.opacity(0.2), lineWidth: 1)
                    )
            }
            
            Button(action: {
                
            }, label: {
                Text("Sign Up")
                
            })
                .buttonStyle(FilledButtonStyle())
                .padding(.vertical, 24)
            
            
            // Already have an account? Login
            HStack {
                Text("Already have an account")
                    .font(.callout)
                    .foregroundColor(.accentColor.opacity(0.6))
                
                NavigationLink(destination: Login()
                                .navigationBarHidden(true)) {
                    Text("Login")
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

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
