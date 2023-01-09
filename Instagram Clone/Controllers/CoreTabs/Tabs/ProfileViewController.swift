//
//  ProfileViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//

//MARK: - Frameworks
import UIKit
import FirebaseAuth

//MARK: - ProfileViewController
final class ProfileViewController: ProfileView {
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonActions()
        configureNavBar()
    }
    
    
    
    //-----------------------------
    //MARK: - Methods
    //-----------------------------
    
    private func configureNavBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .done, target: self, action: #selector(menuButtonPressed))
        navigationController?.navigationBar.tintColor = .label
    }
    

    //-----------------------------
    //MARK: - Button Actions
    //-----------------------------
    
    //Button Actions
    private func buttonActions(){
        signOutButton.addTarget(self, action: #selector(signOutButtonPressed), for: .touchUpInside)
    }

    //Login Button
    @objc private func signOutButtonPressed(){
        AuthManager.shared.signOut()
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: false)
    }
    
    //Menu Button
    @objc private func menuButtonPressed(){
        let vc = MenuViewController()
        self.present(vc, animated: true)
    }
    
}
