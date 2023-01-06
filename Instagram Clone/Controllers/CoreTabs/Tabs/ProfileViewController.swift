//
//  ProfileViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//

import UIKit
import FirebaseAuth

final class ProfileViewController: ProfileView {
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonActions()
    }
    
    

    //-----------------------------
    //MARK: - Button Actions
    //-----------------------------
    
    //Button Actions
    private func buttonActions(){
        signOutButton.addTarget(self, action: #selector(signOutButtonPressed), for: .touchUpInside)
    }

    //Login Button
    @objc func signOutButtonPressed(){
        AuthManager.shared.signOut()
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: false)
    }
    
}
