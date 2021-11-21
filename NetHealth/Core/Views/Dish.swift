//
//  Dish.swift
//  NetHealth
//
//  Created by Anday on 15.11.21.
//

import SwiftUI

struct Dish: View {
    var meal: Meal
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: meal.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                
            } placeholder: {
                ProgressView()
            }
            HStack {
                VStack(alignment: .leading) {
                    Text(meal.name)
                        .font(.largeTitle)
                        .bold()
                        .lineLimit(2)
                        .foregroundColor(.accentColor)
                    Text("Meal: **#\(meal.number)**")
                        .font(.callout)
                    
                    WebView(url: meal.mealUrl)
                    Spacer()
                    HStack {
                        Text("Portion(s): **\(String(meal.portion))**")
                            .font(.title3)
                        Spacer()
                        Text("Calories per portion: **\(Int(meal.calories))**")
                            .font(.title3)
                            
                    }
                }
                Spacer()
            }
            .padding()
            
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct Dish_Previews: PreviewProvider {
    static var previews: some View {
        Dish(meal: dev.meal)
    }
}
