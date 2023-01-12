//
//  MenuCell.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 9.01.2023.
//

//MARK: - Frameworks
import UIKit
import SnapKit

//MARK: - MenuCell
class MenuCell: UITableViewCell {
    
    //MARK: - Identifier
    static let identifier = "MenuCell"

    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    let image : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .label
        return image
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
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
        contentView.addSubview(label)
        
        //Image
        image.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(20)
            make.bottom.equalTo(contentView).offset(-20)
            make.width.equalTo(30)
        }
        
        //Label
        label.snp.makeConstraints { make in
            make.centerY.equalTo(image.snp_centerYWithinMargins)
            make.trailing.equalTo(contentView)
            make.left.equalTo(image.snp_rightMargin).offset(25)
        }
    }
    
}
