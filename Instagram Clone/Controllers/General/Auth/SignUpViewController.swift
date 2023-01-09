//
//  SignUpViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//

import UIKit

class SignUpViewController: SignUpView {
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //View
        view.backgroundColor = .systemBackground
        
        //Delegate
        emailTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        rePasswordTextField.delegate = self
        
        //Methods
        buttonActions()
        hideKeyboard()
    }

    
    //-----------------------------
    //MARK: - Button Actions
    //-----------------------------
    
    //Button Actions
    private func buttonActions(){
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
    }
    
    //Login Button
    @objc func signUpButtonPressed(){
        emailTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        rePasswordTextField.resignFirstResponder()
        
        guard passwordTextField.text == rePasswordTextField.text else {
            self.alertMessage(alertTitle: "Error", alertMesssage: "Password do not match.")
            return
        }
        
        guard let email = emailTextField.text, !email.isEmpty,
              let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let rePassword = rePasswordTextField.text, !rePassword.isEmpty
        else {
            return
        }
        
        AuthManager.shared.signUp(email: email, username: username, password: password) { result in
            DispatchQueue.main.async {
                switch result{
                case.success(_):
                    self.alertMessage(alertTitle: "Success", alertMesssage: "Registration successed!")
                case.failure(let error):
                    self.alertMessage(alertTitle: "Error", alertMesssage: error.localizedDescription)
                }
            }
        }
    }
    
    
    
}


//-----------------------------
//MARK: - UITextFieldDelegate
//-----------------------------

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            usernameTextField.becomeFirstResponder()
        }
        else if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            rePasswordTextField.becomeFirstResponder()
        }
        else if textField == rePasswordTextField {
            signUpButtonPressed()
        }
        
        return true
    }
}
