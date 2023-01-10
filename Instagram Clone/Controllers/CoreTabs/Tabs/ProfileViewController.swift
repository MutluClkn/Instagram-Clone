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
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .done, target: self, action: #selector(menuButtonPressed))
        navigationController?.navigationBar.tintColor = .label
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as? ProfileCell else { return UICollectionViewCell() }
        
        cell.image.image = UIImage(systemName: "person")
        
        return cell
    }
}

//-----------------------------
//MARK: - UICollectionViewDelegateFlowLayout
//-----------------------------

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
