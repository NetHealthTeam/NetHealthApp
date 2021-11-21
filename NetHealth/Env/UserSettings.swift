//
//  UserSettings.swift
//  NetHealth
//
//  Created by Anday on 31.10.21.
//

import Foundation
import SwiftUI

class UserSettings: ObservableObject {
    @Published private(set) var currentUser: User?
    @Published private(set) var token = ""
    
    init() {
        lookForUser()
    }
    
    func lookForUser() {
        DispatchQueue.main.async{
            self.token = UserDefaultsManager.getToken()
            print("Token:", self.token)
            guard self.token != "" else {return}
            Webservice.instance.getUserData(token: self.token) { [weak self] res in
                switch res {
                    case .success(let user):
                    DispatchQueue.main.async{
                        self?.currentUser = user
                        print("Current user:", user)
                    }
                    case .failure(let error):
                        print("Get user Data error:", error)
                }
            }
        }
    }
    
    func logout() {
        UserDefaultsManager.setToken(token: "")
        token = ""
        currentUser = nil
    }
    
}
