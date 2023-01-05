//
//  LoginViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//

//-----------------------------
//MARK: - Frameworks
//-----------------------------

import UIKit

final class LoginViewController: LoginView {
    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    //let loginView = LoginView()
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func loadView() {
        super.loadView()
       // self.view = loginView
    }

}
