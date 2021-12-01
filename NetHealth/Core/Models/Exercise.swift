//
//  Exercise.swift
//  NetHealth
//
//  Created by Anday on 21.11.21.
//

import SwiftUI

/*
 "id": 6,
         "name": "Yoga",
         "imageUrl": "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/766/runninguphill-1501799541.jpg",
         "caloriePerHour": "226-335",
         "duration": 60.000000000000000000000000000,
         "weekday": 2
 
 
 */
struct Exercise: Identifiable, Codable {
    let id: Int
    let name: String
    let imageUrl: String
    let caloriePerHour: String
    let duration: Int
    let weekday: Int
}
