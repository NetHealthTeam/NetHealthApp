//
//  Login.swift
//  NetHealth
//
//  Created by Anday on 18.10.21.
//

import SwiftUI

struct Goal: View {
    @StateObject private var vm: GoalViewModel = GoalViewModel()
    init() {
        UITableView.appearance().backgroundColor = .clear
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
            Form {
                Picker("You want to...", selection: $vm.goal) {
                    Text("sdas")
                }
                .listRowInsets(EdgeInsets())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.accentColor.opacity(0.2), lineWidth: 1)
                )
                .padding(.vertical)
                
                
                
                Picker("How many times a day do you eat?", selection: $vm.goal) {
                    Text("3").tag(1)
                    Text("4").tag(2)
                    Text("5").tag(3)
                }
                .listRowInsets(EdgeInsets())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.accentColor.opacity(0.2), lineWidth: 1)
                )
                .padding(.vertical)
                
                Picker("How often do you work out", selection: $vm.goal) {
                    Text("Once a week").tag(1)
                    Text("Twice a week").tag(2)
                    Text("Thrice a week").tag(3)
                }
                .listRowInsets(EdgeInsets())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.accentColor.opacity(0.2), lineWidth: 1)
                )
                .padding(.vertical)
            }
            
            
            
            
            
            Button(action: {
                
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
        Goal()
    }
}
