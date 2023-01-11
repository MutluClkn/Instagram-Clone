//
//  ExploreCell.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 11.01.2023.
//

//MARK: - Frameworks
import UIKit

//MARK: - ExploreCell
class ExploreCell: UICollectionViewCell {
    
    //MARK: - Identifier
    static let identifier = "ExploreCell"
    
    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    lazy var image : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
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
