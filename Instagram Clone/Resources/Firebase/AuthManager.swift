//
//  AuthManager.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 6.01.2023.
//

//MARK: - Frameworks
import Foundation
import FirebaseAuth

//MARK: - AuthManager
class AuthManager: BaseViewController {
    //Shared
    static let shared = AuthManager()
    
    
    //-----------------------------
    //MARK: - Register
    //-----------------------------
    
    public func register(username: String, email: String, password: String){
        
    }
    
    
    
    //-----------------------------
    //MARK: - Login
    //-----------------------------
    //(Bool) -> Void
    public func login(username: String?, email: String?, password: String, completion: @escaping (Result<Bool, Error>) -> Void){
        
        //E-mail Login
        if let email {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error {
                    //self.alertMessage(alertTitle: "Error", alertMesssage: error.localizedDescription)
                    completion(.failure(error))
                    return
                }
                if authResult != nil {
                    completion(.success(true))
                }
            }
        }
        
        
        //Username Login
        else if let username {
            print(username)
        }
    }
    
}
