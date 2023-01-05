//
//  HomeViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//


//-----------------------------
//MARK: - Frameworks
//-----------------------------

import UIKit
import FirebaseAuth



//-----------------------------
//MARK: - HomeViewController
//-----------------------------

final class HomeViewController: UIViewController {

    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleNoAuth()
    }
    
    
    //-----------------------------
    //MARK: - Methods
    //-----------------------------
    
    private func handleNoAuth(){
        if Auth.auth().currentUser == nil {
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
    
}

