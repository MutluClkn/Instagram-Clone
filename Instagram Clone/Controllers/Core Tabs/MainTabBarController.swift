//
//  MainTabBarController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//

import UIKit

//MARK: - MainTabBarController
final class MainTabBarController: UITabBarController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBarConfiguration()
    }
    
    //MARK: - Tab Bar Configurations
    private func tabBarConfiguration(){
        let homeVC = setupRootVC(vc: HomeViewController()),
            exploreVC = setupRootVC(vc: ExploreViewController()),
            reelsVC = setupRootVC(vc: ReelsViewController()),
            shopVC = setupRootVC(vc: ShopViewController()),
            profileVC = setupRootVC(vc: ProfileViewController())

        homeVC.tabBarItem.image = UIImage(systemName: "house")
        exploreVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        reelsVC.tabBarItem.image = UIImage(systemName: "play.circle")
        shopVC.tabBarItem.image = UIImage(systemName: "bag")
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        tabBar.tintColor = .label
        setViewControllers([homeVC, exploreVC, reelsVC, shopVC, profileVC], animated: true)
    }
    
    //MARK: - Setup Root View Controllers
    private func setupRootVC(vc: UIViewController) -> UINavigationController{
        return UINavigationController(rootViewController: vc)
    }
    
}
