//
//  Exercise.swift
//  NetHealth
//
//  Created by Anday on 21.11.21.
//

import SwiftUI

struct Exercise: Identifiable, Codable {
    let id: Int
    let name: String
    let imageUrl: String
    let caloriePerHour: String
    let duration: Int
    let weekday: Int
}
