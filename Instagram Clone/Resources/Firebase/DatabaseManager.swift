//
//  DatabaseManager.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 6.01.2023.
//

//MARK: - Frameworks
import FirebaseDatabase

//MARK: - DatabaseManager
public class DatabaseManager {
    
    //Shared
    static let shared = DatabaseManager()

    //Database Reference
    private let databaseReference = Database.database().reference()
    
    
    //-----------------------------
    //MARK: - Create New User
    //-----------------------------
    
    public func createNewUser(email: String, username: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        completion(.success(true))
    }
    
    
    //-----------------------------
    //MARK: - Insert New User
    //-----------------------------
    
    public func insertNewUser(email: String, username: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        databaseReference.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if let error {
                completion(.failure(error))
                return
            }
            else {
                completion(.success(true))
                return
            }
        }
    }
}
