//
//  SettingsView.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 6.01.2023.
//

//MARK: - Frameworks
import UIKit
import SnapKit


//MARK: - ProfileView
class SettingsView: BaseViewController {
    
    //MARK: - Properties
    lazy var signOutButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.layer.cornerRadius = AuthConstants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    //MARK: - Constraints
    private func setUpViews(){
        //addSubviews
        view.addSubview(signOutButton)
        
        //Sign Out Button
        signOutButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-80)
            make.height.equalTo(AuthConstants.buttonHeight)
        }
    }
}
