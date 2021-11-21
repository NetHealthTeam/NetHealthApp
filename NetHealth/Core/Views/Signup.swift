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
                    .NHTextFieldStyle(isValid: $vm.isFullNameValid)
                    .padding(.bottom, 8)
                
                TextField("Email", text: $vm.email)
                    .NHTextFieldStyle(isValid: $vm.isEmailValid)
                    .padding(.bottom, 8)
                
                
                TextField("Age", text: $vm.age)
                    .keyboardType(.numberPad)
                    .NHTextFieldStyle(isValid: $vm.isAgeValid)
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
                            .stroke(vm.isPasswordValid ? Color.accentColor.opacity(0.2) : Color.red, lineWidth: 1)
                    )
                
                SecureField("Confirm Password", text: $vm.passwordConfirmation)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(vm.isPasswordConfirmationValid ? Color.accentColor.opacity(0.2) : Color.red, lineWidth: 1)
                    )
            }
            
            
            NavigationLink(destination: Goal(vm: vm)){
                Text("Sign Up")
            }
            .disabled(!vm.isFullNameValid || !vm.isEmailValid || !vm.isAgeValid || !vm.isPasswordValid || !vm.isPasswordConfirmationValid)
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
        .alert(vm.errorText, isPresented: $vm.showError) {
            EmptyView()
        }
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
