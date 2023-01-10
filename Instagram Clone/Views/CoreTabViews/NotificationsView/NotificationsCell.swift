//
//  NotificationsCell.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 10.01.2023.
//

//MARK: - Frameworks
import UIKit
import SnapKit


//MARK: - NotificationsCell
class NotificationsCell: UITableViewCell {
    
    //MARK: - Identifier
    static let identifier = "NotificationsCell"
    
    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------

    lazy var image : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var username : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var overview : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //-----------------------------
    //MARK: - Override Init
    //-----------------------------
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        contentView.addSubview(image)
        contentView.addSubview(username)
        contentView.addSubview(overview)
        
        //Image
        image.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        //Username Label
        username.snp.makeConstraints { make in
            make.top.equalTo(image.snp_topMargin)
            make.trailing.equalTo(contentView).offset(-20)
            make.left.equalTo(image.snp_rightMargin).offset(25)
        }
        
        //Overview Label
        overview.snp.makeConstraints { make in
            make.top.equalTo(username.snp_bottomMargin).offset(10)
            make.left.equalTo(image.snp_rightMargin).offset(25)
            make.trailing.equalTo(contentView).offset(-20)
            make.bottom.equalTo(contentView).offset(-20)
        }
    }
}
