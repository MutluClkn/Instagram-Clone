//
//  SettingsViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 9.01.2023.
//

//MARK: - Frameworks
import UIKit

//MARK: - SettingsViewController
final class SettingsViewController: SettingsView {
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
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
    @objc private func signOutButtonPressed(){
        AuthManager.shared.signOut()
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: false)
    }

}
