//
//  Webservice.swift
//  NetHealth
//
//  Created by Anday on 02.11.21.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

fileprivate struct LoginRequestBody: Encodable {
    let email: String
    let password: String
}

fileprivate struct LoginValueResponse: Decodable {
    var token: String?
}

fileprivate struct LoginResponse: Decodable {

    var value: LoginValueResponse?
    var success: Bool?
    var errors: Array<String?>
}

class Webservice {
    
    func login(email: String, password: String, completition: @escaping (Result<String, AuthenticationError>) -> Void) {
        guard let url = URL(string: "http://localhost:5000/api/registration/signin") else {
            completition(.failure(.custom(errorMessage: "URL is not correct")))
            print("URL ERROR")
            return
        }
        let body = LoginRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completition(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            print(data)
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completition(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.value?.token else {
                completition(.failure(.invalidCredentials))
                return
            }
            completition(.success(token))
        }
        .resume()
    }
}
