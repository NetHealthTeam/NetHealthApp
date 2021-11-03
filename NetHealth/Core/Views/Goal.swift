//
//  Login.swift
//  NetHealth
//
//  Created by Anday on 18.10.21.
//

import SwiftUI

struct Goal: View {
    @ObservedObject var vm: SignupViewModel
    @EnvironmentObject private var userSettingsStorage: UserSettings
    init(vm: SignupViewModel) {
        UITableView.appearance().backgroundColor = .clear
        self.vm = vm
    }
    var body: some View {
        VStack {
            LoginHeaderView(h1Text: "Goal", h2Text: "Let's set your")
                .padding()
            Spacer()
            Image("Goal")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            
            // Inputs
            VStack {
                NHPicker(title: "You want to...", selection: $vm.goal) {
                    Text("Loose weight").tag("Loose weight")
                    Text("Gain weight").tag("Gain weight")
                }
                .padding(.vertical)
                
                
                NHPicker(title: "How many times a day do you eat?", selection: $vm.mealTimes) {
                    Text("3").tag("3")
                    Text("4").tag("4")
                    Text("5").tag("5")
                }
                .padding(.vertical)
                
                NHPicker(title: "How often do you work out?", selection: $vm.workoutTimes) {
                    Text("Once a week").tag("1")
                    Text("Twice a week").tag("2")
                    Text("Thrice a week").tag("3")
                }
                .padding(.vertical)
            }
            
            
            
            
            
            Button(action: {
                vm.proceedSignup(userSettingsStorage: userSettingsStorage)
            }, label: {
                Text("Proceed")
                
            })
                .buttonStyle(FilledButtonStyle())
                .padding(.vertical, 24)
            
            
            
            Spacer()
        }
        .padding(.horizontal, 24)
        
    }
}

struct Goal_Previews: PreviewProvider {
    static var previews: some View {
        Goal(vm: SignupViewModel())
    }
}
