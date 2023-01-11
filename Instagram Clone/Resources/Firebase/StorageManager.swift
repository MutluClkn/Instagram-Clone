//
//  StorageManager.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 11.01.2023.
//

//MARK: - Frameworks
import Foundation
import FirebaseStorage


//MARK: - StorageManager
public final class StorageManager {
    
    //Shared
    static let shared = StorageManager()
    
    //Storage Reference
    private let storageReference = Storage.storage().reference()
    
    
    //-----------------------------
    //MARK: - Upload Post
    //-----------------------------
    
    public func uploadPost(postType: Post, completion: @escaping (Result<URL, Error>) -> Void){
        
    }
    
    
    //-----------------------------
    //MARK: - Download Image
    //-----------------------------
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, StorageManagerError>) -> Void){
        storageReference.child(reference).downloadURL { url, error in
            if error != nil {
                completion(.failure(.failedToDownload))
            }
            if let url {
                completion(.success(url))
            }
            
        }
    }
    
}

//MARK: - PostType Enum
public enum PostType{
    case photo, video
}

//MARK: - Post Struct
public struct Post{
    let postType: PostType
}

//MARK: - Error Enum
public enum StorageManagerError: Error {
    case failedToDownload
}
