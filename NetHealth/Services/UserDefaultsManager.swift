//
//  UserDefaultsManager.swift
//  NetHealth
//
//  Created by Anday on 31.10.21.
//

import Foundation

class UserDefaultsManager {
    static func setToken(token: String) {
        UserDefaults.standard.set(token, forKey: Constants.UDtoken)
    }
    
    static func getToken() -> String {
        UserDefaults.standard.object(forKey: Constants.UDtoken) as? String ?? ""
    }
}
