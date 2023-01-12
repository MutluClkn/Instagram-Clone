//
//  SettingsViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 12.01.2023.
//

//MARK: - Frameworks
import UIKit
import FirebaseAuth

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
    
    //Sign Out Button
    @objc func signOutButtonPressed(){
        self.confirmAlertSheet(alertTitle: "Sign Out", alertMesssage: "Are you sure you want to sign out?", actionTitle: "Sign Out", style: .destructive) { _ in
            AuthManager.shared.signOut { success in
                if success{
                    let loginVC = LoginViewController()
                    loginVC.modalPresentationStyle = .fullScreen
                    self.present(loginVC, animated: true, completion: {
                        self.navigationController?.popToRootViewController(animated: true)
                        self.tabBarController?.selectedIndex = 0
                    })
                }else {
                    fatalError("Sign out failure.")
                }
            }
        }
    }
}
