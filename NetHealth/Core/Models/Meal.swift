//
//  Meal.swift
//  NetHealth
//
//  Created by Anday on 15.11.21.
//

import Foundation

struct Meal: Identifiable, Codable {
    let id: Int
    let number: Int
    let name: String
    let imageUrl: String
    let calories: Double
    let mealUrl: String
    let portion: Double
    
    
    enum CodingKeys: String, CodingKey {
        case id, name, portion, mealUrl, imageUrl
        case calories = "caloryPerPorsion"
        case number = "timeOfDay"
    }
}
