//
//  LoginView.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 5.01.2023.
//

//-----------------------------
//MARK: - Frameworks
//-----------------------------

import UIKit
import SnapKit

//-----------------------------
//MARK: - LoginView
//-----------------------------

class LoginView: UIViewController {

    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    private lazy var usernameEmailTextField : UITextField = {
        let textField = UITextField()
        textField.returnKeyType = .next
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = LoginConstants.cornerRadius
        //addSubview(textField)
        return textField
    }()
    
    private lazy var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.returnKeyType = .next
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = LoginConstants.cornerRadius
        //addSubview(textField)
        return textField
    }()
    
    private lazy var logInButton : UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = LoginConstants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        //addSubview(button)
        return button
    }()
    
    private lazy var termsButton : UIButton = {
        let button = UIButton()
       // addSubview(button)
        return button
    }()
    
    private lazy var privacyButton : UIButton = {
        let button = UIButton()
       // addSubview(button)
        return button
    }()
    
    private lazy var createAccountLabel : UILabel = {
        let label = UILabel()
        label.text = "Don't you have an account?"
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var registerButton : UIButton = {
        let button = UIButton()
        button.setTitle("Register.", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)

       // addSubview(button)
        return button
    }()
    
    private lazy var headerView : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .yellow
        //addSubview(view)
        return view
    }()
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    
    //-----------------------------
    //MARK: - Setup View Constraints
    //-----------------------------
    
    private func setupViews(){
        //addSubviews
        view.addSubview(usernameEmailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountLabel)
        view.addSubview(registerButton)
        view.addSubview(headerView)
        
        
        //Header View
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin)
            make.left.equalTo(view.safeAreaInsets.left)
            make.right.equalTo(view.safeAreaInsets.right)
            make.height.equalTo(view.frame.size.height * 0.3)
        }
        
        //Username-Email TextField
        usernameEmailTextField.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp_bottomMargin).offset(40)
            make.left.equalTo(view.safeAreaInsets.left).offset(20)
            make.right.equalTo(view.safeAreaInsets.right).offset(-20)
            make.height.equalTo(LoginConstants.textFieldHeight)
        }
        
        //Password TextField
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameEmailTextField.snp_bottomMargin).offset(15)
            make.left.equalTo(view.safeAreaInsets.left).offset(20)
            make.right.equalTo(view.safeAreaInsets.right).offset(-20)
            make.height.equalTo(LoginConstants.textFieldHeight)
        }
        
        //Login Button
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(30)
            make.centerX.equalTo(view.snp_centerXWithinMargins)
            make.height.equalTo(LoginConstants.buttonHeight)
            make.width.equalTo(LoginConstants.buttonWidth)
        }
        
        //CreateAccount Label
        createAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp_bottomMargin).offset(30)
            make.left.equalTo(view.safeAreaInsets.left).offset(20)
            make.height.equalTo(LoginConstants.buttonHeight-10)
        }
        
        //Register Button
        registerButton.snp.makeConstraints { make in
            make.centerY.equalTo(createAccountLabel.snp_centerYWithinMargins)
            make.left.equalTo(createAccountLabel.snp_rightMargin).offset(15)
            make.height.equalTo(LoginConstants.buttonHeight-10)
        }
    }

}
