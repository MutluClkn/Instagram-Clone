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
    //MARK: - Sign Up
    //-----------------------------
    
    public func signUp(username: String, email: String, password: String){
        
    }
    
    
    
    //-----------------------------
    //MARK: - Login
    //-----------------------------
    
    //(Bool) -> Void
    public func logIn(username: String?, email: String?, password: String, completion: @escaping (Result<Bool, Error>) -> Void){
        
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
    
    
    //-----------------------------
    //MARK: - Sign Out
    //-----------------------------
    
    public func signOut(){
        do {
            try Auth.auth().signOut()
            print("Sign Out Success")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}
