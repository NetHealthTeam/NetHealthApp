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
                
                TextField("Height (in cm)", text: $vm.height)
                    .keyboardType(.numberPad)
                    .NHTextFieldStyle(isValid: $vm.isHeightValid)
                    .padding(.bottom)
                
                TextField("Weight (in kg)", text: $vm.weight)
                    .keyboardType(.numberPad)
                    .NHTextFieldStyle(isValid: $vm.isWeightValid)
                    .padding(.bottom)

                NHPicker(title: "You want to...", selection: $vm.goal) {
                    Text(Constants.ACTION.LOOSE_WEIGHT).tag(Constants.ACTION.LOOSE_WEIGHT)
                    Text(Constants.ACTION.GAIN_WEIGHT).tag(Constants.ACTION.GAIN_WEIGHT)
                }
                .padding(.bottom)

                
                NHPicker(title: "How many times a day do you eat?", selection: $vm.mealTimes) {
                    Text("3").tag("3")
                    Text("4").tag("4")
                    Text("5").tag("5")
                }
                .padding(.bottom)

                NHPicker(title: "How often do you work out?", selection: $vm.workoutTimes) {
                    Text("Once a week").tag("1")
                    Text("Twice a week").tag("2")
                    Text("Thrice a week").tag("3")
                }
            }
            
            
            
            
            
            Button(action: {
                vm.proceedSignup(userSettingsStorage: userSettingsStorage)
            }, label: {
                Text("Proceed")
                
            })
                .disabled(!vm.isGoalValid || !vm.isMealTimesValid || !vm.isWorkoutTimesValid)
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
