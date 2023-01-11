//
//  ExploreViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//

//MARK: - Frameworks
import UIKit

//MARK: - ExploreViewController
final class ExploreViewController: ExploreView {
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Collection View
        exploreCollectionView.dataSource = self
        exploreCollectionView.delegate = self

    }

}


//-----------------------------
//MARK: - UICollectionViewDataSource
//-----------------------------

extension ExploreViewController: UICollectionViewDataSource {
    
    //Number of Item in Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    //Cell For Item at
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCell.identifier, for: indexPath) as? ExploreCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .yellow
                
        return cell
    }
}

//-----------------------------
//MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------

extension ExploreViewController: UICollectionViewDelegateFlowLayout {
    
    //Size For Item At
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/3.02, height: 200)
    }
    
    //Minimum Interitem Spacing For Section At
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    //Minimum Line Spacing For Section At
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}

