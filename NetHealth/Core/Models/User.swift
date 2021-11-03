//
//  User.swift
//  NetHealth
//
//  Created by Anday on 02.11.21.
//

import Foundation
/*
 {
 "value": {
 "id": 1,
 "email": "majidmg4@code.edu.az",
 "fullName": "Majid Gurbanli",
 "gender": "male",
 "age": 21,
 "weight": 67.000000000000000000000000000,
 "height": 1.9000000000000000000000000000,
 "numberOfMeals": 2,
 "numberOfGyms": 5,
 "amountOfCalories": 0.0000000000000000000000000000,
 "actionName": "Loose weight"
 },
 "success": true,
 "errors": []
 }
 */

struct User: Identifiable, Codable {
    let id: Int
    let email: String
    let fullName: String
    let gender: String
    let age: Int
    let weight: Double
    let height: Double
    let actionName: String
    let numberOfMeals: Int?
    let numberOfGyms: Int?
    let amountOfCalories: Double?
    let password: String?
    let passwordConfirm: String?
    
    init(email: String, fullName: String, gender: String, age: Int, weight: Double, height: Double,  actionName: String, password: String? = nil, passwordConfirm: String? = nil, numberOfMeals: Int? = nil, numberOfGyms: Int? = nil, amountOfCalories: Double? = nil, id: Int? = nil) {
        self.id = id ?? 0
        self.email = email
        self.fullName = fullName
        self.gender = gender
        self.age = age
        self.weight = weight
        self.height = height
        self.actionName = actionName
        self.numberOfMeals = numberOfMeals
        self.numberOfGyms = numberOfGyms
        self.amountOfCalories = amountOfCalories
        self.password = password
        self.passwordConfirm = passwordConfirm
    }
    
        enum CodingKeys: String, CodingKey {
            case id, email, fullName, gender, age, weight, height, actionName, numberOfMeals, numberOfGyms, amountOfCalories, password
            case passwordConfirm = "confirmPassword"
//            case id
//            case email
//            case weight
//            case height
//            case numberOfMeals
//            case numberOfGyms
//            case amountOfCalories
//            case actionName
//            case password
//            case passwordConfirm
        }
}
