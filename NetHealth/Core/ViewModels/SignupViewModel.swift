//
//  SignupViewModel.swift
//  NetHealth
//
//  Created by Anday on 01.11.21.
//

import Foundation

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
}
