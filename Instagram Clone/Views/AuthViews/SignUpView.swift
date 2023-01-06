//
//  SignUpView.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 6.01.2023.
//

//MARK: - Frameworks
import UIKit
import SnapKit

//MARK: - SignUpView
class SignUpView: BaseViewController {
    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    private lazy var instagramLogo : UIImageView = {
        let view = UIImageView(image: UIImage(named: "logo"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var emailTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        textField.backgroundColor = .quaternarySystemFill
        textField.returnKeyType = .next
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        textField.clearButtonMode = .whileEditing
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = AuthConstants.cornerRadius
        return textField
    }()
    
    lazy var usernameTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        textField.backgroundColor = .quaternarySystemFill
        textField.returnKeyType = .next
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.clearButtonMode = .whileEditing
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = AuthConstants.cornerRadius
        return textField
    }()
    
    lazy var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        textField.backgroundColor = .quaternarySystemFill
        textField.isSecureTextEntry = true
        textField.returnKeyType = .next
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.clearButtonMode = .whileEditing
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = AuthConstants.cornerRadius
        return textField
    }()
    
    lazy var rePasswordTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(
            string: "Confirm Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        textField.backgroundColor = .quaternarySystemFill
        textField.isSecureTextEntry = true
        textField.returnKeyType = .go
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.clearButtonMode = .whileEditing
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = AuthConstants.cornerRadius
        return textField
    }()
    
    lazy var signUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = AuthConstants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signUpStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, usernameTextField, passwordTextField,  signUpButton])
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()

    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    
    //-----------------------------
    //MARK: - Setup View Constraints
    //-----------------------------
    
    private func setupViews(){
        //addSubviews
        view.addSubview(instagramLogo)
        view.addSubview(signUpStackView)
        
        //Header View
        instagramLogo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-100)
            make.height.equalTo(view.frame.size.height * 0.12)
        }
        
        //Login Stack View
        signUpStackView.snp.makeConstraints { make in
            make.top.equalTo(instagramLogo.snp_bottomMargin).offset(30)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        //Username-Email TextField
        emailTextField.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(signUpStackView.safeAreaLayoutGuide)
            make.height.equalTo(AuthConstants.textFieldHeight)
        }
        
        //Username TextField
        usernameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(signUpStackView.safeAreaLayoutGuide)
            make.height.equalTo(AuthConstants.textFieldHeight)
        }
        
        //Password TextField
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(signUpStackView.safeAreaLayoutGuide)
            make.height.equalTo(AuthConstants.textFieldHeight)
        }
        /*
        //Confirm Password TextField
        rePasswordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(signUpStackView.safeAreaLayoutGuide)
            make.height.equalTo(LoginConstants.textFieldHeight)
        }*/
        
        //Login Button
        signUpButton.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(signUpStackView.safeAreaLayoutGuide)
            make.height.equalTo(AuthConstants.buttonHeight)
        }
    }
    

}
