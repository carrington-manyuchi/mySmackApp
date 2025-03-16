//
//  AuthService.swift
//  mySmackApp
//
//  Created by Manyuchi, Carrington C on 2025/03/16.
//

import Foundation
import Alamofire

class AuthService {
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HTTPHeaders(header)).responseJSON { response in
            switch response.result {
            case .success:
                // Check if status code is 200 OK (or whatever success code you expect)
                if let statusCode = response.response?.statusCode, statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
                
            case .failure(let error):
                // Pass the error to the completion handler or log it
                print("Error registering user: \(error.localizedDescription)")
                completion(false)
            }
        }
        
        
    }
    
    
    
}
