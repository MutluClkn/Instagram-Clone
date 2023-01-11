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
final class AuthManager: BaseViewController {
    //Shared
    static let shared = AuthManager()
    //Auth
    private let auth = Auth.auth()
    
    
    
    //-----------------------------
    //MARK: - Sign Up
    //-----------------------------
    
    public func signUp(email: String, username: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void){
        
        //Check if username-email is available to create a new account.
        DatabaseManager.shared.createNewUser(email: email, username: username) { result in
            
            switch result{
            case.success(_):
                //Create a new account
                self.auth.createUser(withEmail: email, password: password){ result, error in
                    if let error {
                        completion(.failure(error))
                        return
                    }
                    if result != nil {
                        DatabaseManager.shared.insertNewUser(email: email, username: username) { result in
                            switch result{
                            case.success(_):
                                completion(.success(true))
                                return
                            case.failure(let error):
                                completion(.failure(error))
                                return
                            }
                        }
                    }
                }
            case.failure(let error):
                completion(.failure(error))
                return
            }
        }
    }
    
    
    
    //-----------------------------
    //MARK: - Login
    //-----------------------------
    
    //(Bool) -> Void
    public func logIn(username: String?, email: String?, password: String, completion: @escaping (Result<Bool, Error>) -> Void){
        
        //E-mail Login
        if let email {
            auth.signIn(withEmail: email, password: password) { authResult, error in
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
            
        }
    }
    
    
    
    //-----------------------------
    //MARK: - Sign Out
    //-----------------------------
    
    public func signOut(completion: @escaping (Bool) -> Void){
        do {
            try auth.signOut()
            completion(true)
        } catch let signOutError as NSError {
            completion(false)
            print("Error signing out: %@", signOutError)
        }
    }
    
}
