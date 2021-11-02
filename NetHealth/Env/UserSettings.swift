//
//  UserSettings.swift
//  NetHealth
//
//  Created by Anday on 31.10.21.
//

import Foundation
import SwiftUI

class UserSettings: ObservableObject {
    @Published private(set) var fullName = ""
    @Published private(set) var token = ""
    
    init() {
       lookForUser()
    }
    
    func lookForUser() {
        DispatchQueue.main.async{
            self.token = UserDefaultsManager.getToken()
        }
        
    }
    
}
