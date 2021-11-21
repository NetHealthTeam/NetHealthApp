//
//  WorkoutItem.swift
//  NetHealth
//
//  Created by Anday on 21.11.21.
//

import SwiftUI

struct WorkoutItem: View {
    var exercise: Exercise
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: exercise.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(exercise.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(.accentColor)
                        .padding(.vertical)
                
                    Text("Calory burn: **\(exercise.caloriePerHour) cal/hour**")
                        .font(.body)
                    
                    Text("Duration: **\(exercise.duration) min**")
                        .font(.body)
                    
                }
                .padding()
            }
        }
        .background(Color.theme.main.cornerRadius(12))
        .padding(.horizontal)
    }
}

struct WorkoutItem_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
        WorkoutItem(exercise: dev.exercise)
        }
    }
}
