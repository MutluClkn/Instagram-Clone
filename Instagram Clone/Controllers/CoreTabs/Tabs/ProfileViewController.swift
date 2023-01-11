//
//  ProfileViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//

//MARK: - Frameworks
import UIKit
import FirebaseAuth

//MARK: - ProfileViewController
final class ProfileViewController: ProfileView {
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        //Methods
        configureNavBar()
        
        //Collection View
        profileCollectionView.dataSource = self
        profileCollectionView.delegate = self
        
        //Temporary datas
        profilePhoto.image = UIImage(systemName: "person")
        username.text = "Mutlu"
        profileDescription.text = "iOS Developer"
        postsCount.text = "0"
        followersCount.text = "167"
        followingCount.text = "300"
    }
    
    
    //-----------------------------
    //MARK: - Methods
    //-----------------------------
    
    private func configureNavBar(){
        //Right
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .done, target: self, action: #selector(menuButtonPressed))
        navigationController?.navigationBar.tintColor = .label
        //Left
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "mutluclkn", style: .done, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 21, weight: .bold)], for: .normal)
    }
    

    //-----------------------------
    //MARK: - Button Actions
    //-----------------------------
    
    //Menu Button
    @objc private func menuButtonPressed(){
        let vc = MenuViewController()
        self.present(vc, animated: true)
    }
    
}


//-----------------------------
//MARK: - UICollectionViewDataSource
//-----------------------------

extension ProfileViewController: UICollectionViewDataSource {
    
    //Number of Item in Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    //Cell For Item at
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as? ProfileCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .yellow
                
        return cell
    }
}

//-----------------------------
//MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
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
