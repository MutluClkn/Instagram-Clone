//
//  ProfileCell.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 10.01.2023.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    static let identifier = "ProfileCell"
    
    lazy var image : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        image.frame = contentView.bounds
    }
    
}
