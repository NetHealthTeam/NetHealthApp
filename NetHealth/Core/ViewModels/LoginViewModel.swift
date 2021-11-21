//
//  LoginViewModel.swift
//  NetHealth
//
//  Created by Anday on 21.10.21.
//

import Foundation
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isEmailValid: Bool = true
    @Published var isPasswordValid: Bool = true
    
    @Published var showError: Bool = false
    @Published var errorText: String = ""
    
    var cancellables = Set<AnyCancellable>()
    init() {
        emailValidator()
        passwordValidator()
        emptyFieldsCheckers()
    }
    
    func proceedLogin(userSettingsStorage: UserSettings) {
        emptyFieldsCheckers()
        if !isEmailValid || !isPasswordValid {
            return
        }
        // Send credentials to server
        Webservice.instance.login(email: email, password: password) { res in
            switch res {
            case .success(let token):
                print(token)
                UserDefaultsManager.setToken(token: token)
                userSettingsStorage.lookForUser()
            case .failure(let error):
                if error == .invalidCredentials {
                    DispatchQueue.main.async {
                        self.showError(text: "Invalid Credentials")
                    }
                }
                print(error)
            }
        }
    }
    
    // Public function
    func showError(text: String) {
        errorText = text
        showError = true
    }
    
    
    // Validators
    
    private func emptyFieldsCheckers() {
        if email.isEmpty {
            isEmailValid = false
        }
        if password.isEmpty {
            isPasswordValid = false
        }
    }
    
    private func emailValidator() {
        $email.sink {[weak self] val in
            guard let self = self else {return}
            self.isEmailValid = self.emailRegexChecker(self.email)
        }
        .store(in: &cancellables)
    }
    
    private func passwordValidator() {
        $password.sink { [weak self] Value in
            guard let self = self else { return }
            self.isPasswordValid = self.passwordRegexChecker(self.password)
        }
        .store(in: &cancellables)
    }
    
    private func emailRegexChecker(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    private func passwordRegexChecker(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let passwordFormat = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordFormat)
        return passwordPredicate.evaluate(with: string)
    }
}
