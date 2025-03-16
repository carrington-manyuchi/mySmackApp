//
//  AuthService.swift
//  mySmackApp
//
//  Created by Manyuchi, Carrington C on 2025/03/16.
//

import Foundation
import Alamofire
import SwiftyJSON

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
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HTTPHeaders(HEADER))
            .validate(statusCode: 200..<300)
            .responseDecodable(of: RegisterResponse.self) { response in
                switch response.result {
                case .success:
                    if let statusCode = response.response?.statusCode, statusCode == 200 {
                        completion(true)
                    } else {
                        completion(false)
                    }
                    
                case .failure(let error):
                    let statusCode = response.response?.statusCode
                    print("Request failed with status code: \(statusCode ?? 0), Error: \(error.localizedDescription)")
                    completion(false)
                }
            }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HTTPHeaders(HEADER))
            .responseDecodable(of: RegisterResponse.self) { response in
                           
                   switch response.result {
                   case .success:
                       // Check if status code is 200 OK (or whatever success code you expect)
                       if let statusCode = response.response?.statusCode, statusCode == 200 {
                           do {
                               guard let data = response.data else { return }
                               let json = try JSON(data: data)
                               self.userEmail = json["user"].stringValue
                               self.authToken = json["token"].stringValue
                               self.isLoggedIn = true
                               completion(true)
                           } catch {
                               print("Error parsing JSON: \(error.localizedDescription)")
                               completion(false)
                           }
                       } else {
                           completion(false)
                       }
                       
                   case .failure(let error):
                       // Pass the error to the completion handler or log it
                       print("Error logging in user: \(error.localizedDescription)")
                       completion(false)
                   }
               }
    }
    
    
    
    
    
    
    
}
