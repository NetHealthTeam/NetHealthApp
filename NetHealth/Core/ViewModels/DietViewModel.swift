//
//  DietViewModel.swift
//  NetHealth
//
//  Created by Anday on 17.11.21.
//

import Foundation


class DietViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    func fetchMeals(usettings: UserSettings) {
        Webservice.instance.getDailyDiet(token: usettings.token) { res in
            switch res {
            case .success(let meals):
                DispatchQueue.main.async {
                    self.meals = meals.compactMap({ meal -> Meal? in
                        if let meal = meal {
                            return meal
                        }
                        return nil
                    })
                    print("MEALS:", self.meals)
                }
            
            case .failure(let error):
                print("fetchMeals: ",error)
            
            }
        }
    }
}
