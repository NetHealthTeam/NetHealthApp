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
    @Published var fullName: String = "Anday Ismayilzada"
    @Published var email: String = "anday" + UUID().uuidString.prefix(4) +  "@gmail.com"
    @Published var age: String = "21"
    @Published var gender: Gender = .male
    @Published var password: String = "Password@123"
    @Published var passwordConfirmation: String = "Password@123"
    
    @Published var weight: Double = 78
    @Published var height: Double = 172
    @Published var goal: String = "Loose weight"
    @Published var mealTimes: String = "4"
    @Published var workoutTimes: String = "3"
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        $goal.sink { g in
            print(g)
        }
        .store(in: &cancellables)
        
        
    }
    
    func proceedSignup(userSettingsStorage: UserSettings){
        Webservice.instance.signup(user: User(email: email, fullName: fullName, gender: gender.rawValue, age: Int(age) ?? 0, weight: Double(weight), height: Double(height), actionName: goal, password: password, passwordConfirm: passwordConfirmation, numberOfMeals: Int(mealTimes), numberOfGyms: Int(workoutTimes)))
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
                print(error)
            }
        }
    }
}
