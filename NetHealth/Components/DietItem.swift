//
//  DietItem.swift
//  NetHealth
//
//  Created by Anday on 15.11.21.
//

import SwiftUI

struct DietItem: View {
    var meal: Meal
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Meal #\(meal.number)")
                        .font(.title)
                        .bold()
                        .foregroundColor(.accentColor)
                    Text(meal.name)
                        .font(.callout)
                }
                .padding()
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Portion(s): **\(String(meal.portion))**")
                        .font(.callout)
                    
                }
                .padding()
            }
        }
        .background(Color.theme.main.cornerRadius(12))
        .padding(.horizontal)
    }
}

struct DietItem_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ScrollView {
                DietItem(meal: dev.meal)
            }
            
        }
    }
}
