//
//  SignupViewModel.swift
//  NetHealth
//
//  Created by Anday on 01.11.21.
//

import Foundation
import Combine

enum Gender: String, CaseIterable {
    case male = "Male", female = "Female", other = "Other"
}

class SignupViewModel: ObservableObject {
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var age: String = ""
    @Published var gender: Gender = .male
    @Published var password: String = ""
    @Published var passwordConfirmation: String = ""
    
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var goal: String = Constants.ACTION.LOOSE_WEIGHT
    @Published var mealTimes: String = "3"
    @Published var workoutTimes: String = "1"
    
    @Published var showError: Bool = false
    @Published var errorText: String = ""
    
    
    // Validators
    @Published var isFullNameValid: Bool = true
    @Published var isEmailValid: Bool = true
    @Published var isAgeValid: Bool = true
    @Published var isPasswordValid: Bool = true
    @Published var isPasswordConfirmationValid: Bool = true
    
    @Published var isWeightValid: Bool = true
    @Published var isHeightValid: Bool = true
    @Published var isGoalValid: Bool = true
    @Published var isMealTimesValid: Bool = true
    @Published var isWorkoutTimesValid: Bool = true
    
    var cancellables = Set<AnyCancellable>()
    
    
    init() {
        registrationFieldChecker()
    }
    
    
    func proceedSignup(userSettingsStorage: UserSettings){
        Webservice.instance.signup(user: User(email: email, fullName: fullName, gender: gender.rawValue, age: Int(age) ?? 0, weight: Double(weight) ?? 0, height: Double(height) ?? 0, actionName: goal, password: password, passwordConfirm: passwordConfirmation, numberOfMeals: Int(mealTimes), numberOfGyms: Int(workoutTimes)))
        { res in
            switch res {
            case .success(let success):
                print("REGISTER RESPONSE:", success)
                Webservice.instance.login(email: self.email, password: self.password) { res in
                    switch res{
                    case .success(let token):
                        UserDefaultsManager.setToken(token: token)
                        userSettingsStorage.lookForUser()
                    case .failure(_):
                        print("Unexpected error")
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError(text: "Unexpected error")
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
    
    func registrationFieldChecker() {
        $fullName.sink {[weak self] val in
            if val.isEmpty {
                self?.isFullNameValid = false
            }
            else {
                self?.isFullNameValid = true
            }
        }
        .store(in: &cancellables)
        
        $email.sink {[weak self] val in
            guard let self = self else { return }
            if val.isEmpty || !self.emailRegexChecker(val) {
                self.isEmailValid = false
            }
            else {
                self.isEmailValid = true
            }
        }
        .store(in: &cancellables)
        
        
        $age.sink {[weak self] val in
            if val.isEmpty || !val.isNumeric {
                self?.isAgeValid = false
            }
            else {
                self?.isAgeValid = true
            }
        }
        .store(in: &cancellables)
        
        
        $password.sink {[weak self] val in
            guard let self = self else { return }
            if val.isEmpty || !self.passwordRegexChecker(val){
                self.isPasswordValid = false
            }
            else {
                self.isPasswordValid = true
            }
        }
        .store(in: &cancellables)
        
        $passwordConfirmation.sink {[weak self] val in
            if val.isEmpty || val != self?.password {
                self?.isPasswordConfirmationValid = false
            }
            else {
                self?.isPasswordConfirmationValid = true
            }
        }
        .store(in: &cancellables)
    }
    
    func goalEmptyFieldChecker() {
        $weight.sink { [weak self] val in
            guard let self = self else { return }
            if Double(val) ?? 0 > 0 {
                self.isWeightValid = false
            }
            else {
                self.isWeightValid = true
            }
        }
        .store(in: &cancellables)
        $height.sink { [weak self] val in
            guard let self = self else { return }
            if Double(val) ?? 0 > 0 {
                self.isHeightValid = false
            }
            else {
                self.isHeightValid = true
            }
        }
        .store(in: &cancellables)
        $goal.sink { [weak self] val in
            guard let self = self else { return }
            if val.isEmpty {
                self.isGoalValid = false
            }
            else {
                self.isGoalValid = true
            }
        }
        .store(in: &cancellables)
        $mealTimes.sink { [weak self] val in
            guard let self = self else { return }
            if val.isEmpty {
                self.isMealTimesValid = false
            }
            else {
                self.isMealTimesValid = true
            }
        }
        .store(in: &cancellables)
        $workoutTimes.sink { [weak self] val in
            guard let self = self else { return }
            if val.isEmpty {
                self.isWorkoutTimesValid = false
            }
            else {
                self.isWorkoutTimesValid = true
            }
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
