//
//  LoginViewModel.swift
//  NetHealth
//
//  Created by Anday on 21.10.21.
//

import Foundation
import SwiftUI


class LoginViewModel: ObservableObject {
    @Published var email: String = "majidmg4@code.edu.az"
    @Published var password: String = "Miko1231??"
    
    func proceedLogin(userSettingsStorage: UserSettings) {
        // Send credentials to server
        Webservice.instance.login(email: email, password: password) { res in
            switch res {
            case .success(let token):
                print(token)
                UserDefaultsManager.setToken(token: token)
                userSettingsStorage.lookForUser()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
