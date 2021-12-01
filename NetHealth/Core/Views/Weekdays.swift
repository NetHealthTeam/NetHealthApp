//
//  Weekdays.swift
//  NetHealth
//
//  Created by Anday on 23.11.21.
//

import SwiftUI

fileprivate let _weekdays_list = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]


struct Weekdays: View {
    @StateObject private var vm = WorkoutViewModel()
    @EnvironmentObject private var usettings: UserSettings
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(vm.weekdays.sorted(), id: \.self) { weekday in
                    NavigationLink(destination: Workout(vm: vm, weekday: weekday).toolbarWithTitle(title: "🏃‍♂️ Your Workout Plan!")) {
                        MenuItem(title: _weekdays_list[weekday - 1], imageName: "Workout")
                    }
                    .frame(height: 150)
                    .padding([.horizontal, .bottom])
                }
            }
        }
        .onAppear {
            vm.fetchWorkout(usettings: usettings)
        }
    }
}

struct Weekdays_Previews: PreviewProvider {
    static var previews: some View {
        Weekdays()
            .environmentObject(UserSettings())
    }
}
