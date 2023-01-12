//
//  SettingsView.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 12.01.2023.
//

//MARK: - Frameworks
import UIKit
import SnapKit

//MARK: - SettingsView
class SettingsView: BaseViewController {
    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    lazy var signOutButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Out", for: .normal)
       // button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
    }

    
    //-----------------------------
    //MARK: - Setup Constraints
    //-----------------------------
    
    private func setupConstraints(){
        //addSubviews
        view.addSubview(signOutButton)
        
        //Sign Out Button
        signOutButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(30)
            make.left.equalTo(view.snp_leftMargin).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
}
