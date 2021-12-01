//
//  WorkoutViewModel.swift
//  NetHealth
//
//  Created by Anday on 23.11.21.
//

import Foundation
import Combine

class WorkoutViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    @Published var weekdays: [Int] = []
    var cancellables = Set<AnyCancellable>()
    
    
    init() {
        exercisesListener()
    }
    
    func fetchWorkout(usettings: UserSettings) {
        Webservice.instance.getWorkoutProgram(token: usettings.token) { res in
            switch res {
            case .success(let exercises):
                DispatchQueue.main.async {
                    self.exercises = exercises.compactMap({ ex -> Exercise? in
                        if let ex = ex {
                            return ex
                        }
                        return nil
                    })
                }
            
            case .failure(let error):
                print("fetchExercises: ",error)
            }
        }
    }
    
    
    func exercisesListener() {
        $exercises.sink { [weak self] exes in
            guard let self = self else { return }
            self.weekdays = exes.compactMap({ ex -> Int? in
                ex.weekday
            })
            self.weekdays = Array(Set(self.weekdays))
        }
        .store(in: &cancellables)
    }
}
