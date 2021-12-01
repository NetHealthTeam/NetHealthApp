//
//  Workout.swift
//  NetHealth
//
//  Created by Anday on 23.11.21.
//

import SwiftUI

struct Workout: View {
    @ObservedObject var vm: WorkoutViewModel
    @EnvironmentObject private var usettings: UserSettings
    var weekday: Int
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(vm.exercises, id: \.id) { ex in
                    if ex.weekday == weekday{
                        WorkoutItem(exercise: ex)
                        
                    }
                }
            }
        }

    }
}

struct Workout_Previews: PreviewProvider {
    static var previews: some View {
        Workout(vm: WorkoutViewModel(), weekday: 2)
            .environmentObject(UserSettings())
    }
}
