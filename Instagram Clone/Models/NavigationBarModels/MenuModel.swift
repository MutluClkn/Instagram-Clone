//
//  MenuModel.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 9.01.2023.
//

import UIKit

struct MenuModel {
    let label: String
    let imageName: String
    
    var setImage : UIImage {
        guard let image = UIImage(systemName: imageName) else { return UIImage() }
        return image
    }
}
