//
//  Webservice.swift
//  NetHealth
//
//  Created by Anday on 02.11.21.
//

import Foundation

enum AuthenticationError: Error, Equatable {
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

// Signup

fileprivate struct SignupErrorResponse: Decodable {
    var errorMsg: String?
}

fileprivate struct SignupResponse: Decodable {
    var success: Bool?
    var error: Array<SignupErrorResponse?>?
}


// Get User Data
fileprivate struct UserDataResponse: Decodable {
    var value: User?
    var success: Bool?
    var errors: Array<SignupErrorResponse?>?
}


// Get Daily Meat Data
fileprivate struct DailyMealsResponse: Decodable {
    var meals: Array<Meal?>
}

class Webservice {
    
    private init() {}
    
    static let instance = Webservice()
    
    func login(email: String, password: String, completition: @escaping (Result<String, AuthenticationError>) -> Void) {
        guard let url = URL(string: Constants.SERVER_URL + "/api/registration/signin") else {
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
    
    func signup(user: User, completition: @escaping (Result<Bool,AuthenticationError>) -> Void) {
        guard let url = URL(string: Constants.SERVER_URL + "/api/registration/registration") else {
            completition(.failure(.custom(errorMessage: "URL is not correct")))
            print("URL ERROR")
            return
        }
        let body = user
        
        print(user.actionName)
        
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
            print(String(decoding: data, as: UTF8.self))
            guard let signupResponse = try? JSONDecoder().decode(SignupResponse.self, from: data) else {
                guard let res = response as? HTTPURLResponse else {return}
                if res.statusCode == 400 {
                    // Handle C# default error
                    /*{
                     "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
                     "title": "One or more validation errors occurred.",
                     "status": 400,
                     "traceId": "00-cd6fdae3b945a44498bc5b7c8482cba2-84432d24d01cf647-00",
                     "errors": {
                     "Email": [
                     "empty_email",
                     "email_not_correct"
                     ]
                     }
                     }*/
                }
                completition(.failure(.invalidCredentials))
                return
            }
            
            guard let success = signupResponse.success else {
                completition(.failure(.custom(errorMessage: signupResponse.error?.first??.errorMsg ?? "")))
                return
            }
            
            completition(.success(success))
        }
        .resume()
    }
    
    func getUserData(token: String, completition: @escaping (Result<User,AuthenticationError>) -> Void) {
        guard let url = URL(string: Constants.SERVER_URL + "/api/user/personalcabinet") else {
            completition(.failure(.custom(errorMessage: "URL is not correct")))
            print("URL ERROR")
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completition(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let userDataResponse = try? JSONDecoder().decode(UserDataResponse.self, from: data) else {
                guard let utferror = try? JSONSerialization.jsonObject(with: data, options: []) else {
                    completition(.failure(.invalidCredentials))
                    return
                }
                if let responseJSON = utferror as? [String: Any] {
                    print(responseJSON)
                    completition(.failure(.invalidCredentials))
                }
                return
            }
            guard let user = userDataResponse.value else {
                completition(.failure(.custom(errorMessage: "User not received")))
                return}
            completition(.success(user))
        }
        .resume()
    }
    
    func getDailyDiet(token: String, completition: @escaping (Result<[Meal?], AuthenticationError>) -> Void) {
        guard let url = URL(string: Constants.SERVER_URL + "/api/diet/getdailydiet") else {
            completition(.failure(.custom(errorMessage: "URL is not correct")))
            print("URL ERROR")
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completition(.failure(.custom(errorMessage: "No data")))
                return
            }
//            print(String(decoding: data, as: UTF8.self))

            guard let dailyMealsResponse = try? JSONDecoder().decode(DailyMealsResponse.self, from: data) else {
                completition(.failure(.custom(errorMessage: "No meals")))
                return
            }

            completition(.success(dailyMealsResponse.meals))
        }
        .resume()
    }
}
