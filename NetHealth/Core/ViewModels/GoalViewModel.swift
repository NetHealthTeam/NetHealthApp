//
//  GoalViewModel.swift
//  NetHealth
//
//  Created by Anday on 02.11.21.
//

import Foundation

class GoalViewModel: ObservableObject {
    @Published var goal: String = ""
    @Published var mealTimes: String = ""
    @Published var workoutTimes: String = ""
}
