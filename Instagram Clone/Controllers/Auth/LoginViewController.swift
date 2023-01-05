//
//  LoginViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//


//MARK: - Frameworks
import UIKit

//MARK: - LoginViewController
final class LoginViewController: LoginView {
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //View
        view.backgroundColor = .systemBackground
        
        //Delegate
        usernameEmailTextField.delegate = self
        passwordTextField.delegate = self
        
        //Methods
        buttonActions()
        hideKeyboard()
    }
    
    
    
    //-----------------------------
    //MARK: - Methods
    //-----------------------------
    
    private func buttonActions(){
        logInButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonPressed), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
    }
    
}


//-----------------------------
//MARK: - UITextFieldDelegate
//-----------------------------

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameEmailTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField{
            loginButtonPressed()
        }
        
        return true
    }
}
