//
//  HomeFeedCell.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 11.01.2023.
//

//MARK: - Frameworks
import UIKit
import SnapKit

//MARK: - HomeFeedCell
class HomeFeedCell: UITableViewCell {
    
    //MARK: - Identifier
    static let identifier = "HomeFeedCell"
    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    lazy var username: UILabel = {
       let label = UILabel()
        label.tintColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    
    
    
    //-----------------------------
    //MARK: - Override Init
    //-----------------------------
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Setup Constraints
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //-----------------------------
    //MARK: - Setup Constraints
    //-----------------------------
    
    private func setupConstraints(){
        //addSubviews
        contentView.addSubview(username)
        
        //Username
        username.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(contentView)
        }
    }
    
}
