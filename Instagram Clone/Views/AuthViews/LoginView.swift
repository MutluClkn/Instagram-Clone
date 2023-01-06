//
//  LoginView.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 5.01.2023.
//


//MARK: - Frameworks
import UIKit
import SnapKit


//MARK: - LoginView
class LoginView: BaseViewController {

    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    private lazy var instagramLogo : UIImageView = {
        let view = UIImageView(image: UIImage(named: "logo"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var usernameEmailTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(
            string: "Username or Email",
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
    
    lazy var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
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
    
    lazy var logInButton : UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = AuthConstants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var forgotPasswordLabel : UILabel = {
        let label = UILabel()
        label.text = "Forgot your log in details?"
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var forgotPasswordButton : UIButton = {
        let button = UIButton()
        button.setTitle("Recover password.", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var seperatorLabel : UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var createAccountLabel : UILabel = {
        let label = UILabel()
        label.text = "Don't you have an account?"
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var signUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sign up.", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var loginStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameEmailTextField, passwordTextField, logInButton])
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()
    
    private lazy var forgotPassStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [forgotPasswordLabel, forgotPasswordButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var signUpStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [createAccountLabel, signUpButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var authStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [forgotPassStackView, seperatorLabel, signUpStackView])
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 10
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
        view.addSubview(loginStackView)
        view.addSubview(authStackView)
        
        //Header View
        instagramLogo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-100)
            make.height.equalTo(view.frame.size.height * 0.12)
        }
        
        //Login Stack View
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(instagramLogo.snp_bottomMargin).offset(30)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        //Auth Stack View (Sign Up - Forgot Passowrd)
        authStackView.snp.makeConstraints { make in
            make.top.equalTo(loginStackView.snp_bottomMargin).offset(30)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        //Username-Email TextField
        usernameEmailTextField.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(loginStackView.safeAreaLayoutGuide)
            make.height.equalTo(AuthConstants.textFieldHeight)
        }
        
        //Password TextField
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(loginStackView.safeAreaLayoutGuide)
            make.height.equalTo(AuthConstants.textFieldHeight)
        }
        
        //Login Button
        logInButton.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(loginStackView.safeAreaLayoutGuide)
            make.height.equalTo(AuthConstants.buttonHeight)
        }
    }

}
