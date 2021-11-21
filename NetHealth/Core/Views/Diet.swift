//
//  Diet.swift
//  NetHealth
//
//  Created by Anday on 15.11.21.
//

import SwiftUI

struct Diet: View {
    @StateObject private var vm = DietViewModel()
    @EnvironmentObject private var usettings: UserSettings
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(vm.meals, id: \.id) { meal in
                    NavigationLink(destination: Dish(meal: meal)) {
                        DietItem(meal: meal)
                    }
                }
            }
        }
        .onAppear {
            vm.fetchMeals(usettings: usettings)
        }
    }
    
}

struct Diet_Previews: PreviewProvider {
    static var previews: some View {
        Diet()
            .environmentObject(UserSettings())
    }
}
