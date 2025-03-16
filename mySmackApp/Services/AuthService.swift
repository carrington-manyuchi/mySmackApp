//
//  AuthService.swift
//  mySmackApp
//
//  Created by Manyuchi, Carrington C on 2025/03/16.
//

import Foundation
import Alamofire

struct RegisterResponse: Decodable {
    let success: Bool
    let message: String?
}

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
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HTTPHeaders(header))
            .validate(statusCode: 200..<300)
            .responseDecodable(of: RegisterResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(data.success)
                case .failure(let error):
                    let statusCode = response.response?.statusCode
                    print("Request failed with status code: \(statusCode ?? 0), Error: \(error.localizedDescription)")
                }
            }
        
    }
    
}
