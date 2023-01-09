//
//  LoginViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//


//MARK: - Frameworks
import UIKit
import FirebaseAuth

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
    //MARK: - Button Actions
    //-----------------------------
    
    //Button Actions
    private func buttonActions(){
        logInButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonPressed), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
    }
    
    //Login Button
    @objc func loginButtonPressed(){
        checkAuth()
    }
    
    //Forgot Password Button
    @objc func forgotPasswordButtonPressed(){
        
    }
    
    //Sign Up Button
    @objc func signUpButtonPressed(){
        let vc = SignUpViewController()
        vc.title = "Sign Up"
        self.present(UINavigationController(rootViewController: vc), animated: true )
    }
    
    
    //-----------------------------
    //MARK: - CheckAuth
    //-----------------------------
    
    //Check user auth
    private func checkAuth(){
        usernameEmailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailTextField.text, !usernameEmail.isEmpty,
              let password = passwordTextField.text, !password.isEmpty
        else {
            return
        }
        
        //Check username or email
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            email = usernameEmail
        }else {
            username = usernameEmail
        }
        
        //Spinner Indicator
        let alertController = UIAlertController(title: nil, message: "Please wait\n\n", preferredStyle: .alert)
        let spinnerIndicator = UIActivityIndicatorView(style: .large)
        spinnerIndicator.center = CGPoint(x: 135.0, y: 65.5)
        spinnerIndicator.color = UIColor.black
        spinnerIndicator.startAnimating()
        alertController.view.addSubview(spinnerIndicator)
        self.present(alertController, animated: false, completion: nil)
        
        //AuthManager
        AuthManager.shared.logIn(username: username, email: email, password: password) { result in
            DispatchQueue.main.async {
                switch result{
                case .success(_):
                    alertController.dismiss(animated: true, completion: nil);
                    self.dismiss(animated: true)
                case .failure(let error):
                    alertController.dismiss(animated: true, completion: nil);
                    self.alertMessage(alertTitle: "Error", alertMesssage: error.localizedDescription)
                }
            }
        }
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
