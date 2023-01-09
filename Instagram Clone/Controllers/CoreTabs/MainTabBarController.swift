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
            cameraVC = setupRootVC(vc: CameraViewController()),
            notificationsVC = setupRootVC(vc: NotificationsViewController()),
            profileVC = setupRootVC(vc: ProfileViewController())

        homeVC.tabBarItem.image = UIImage(systemName: "house")
        exploreVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        cameraVC.tabBarItem.image = UIImage(systemName: "plus.square")
        notificationsVC.tabBarItem.image = UIImage(systemName: "heart")
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        tabBar.tintColor = .label
        setViewControllers([homeVC, exploreVC, cameraVC, notificationsVC, profileVC], animated: true)
    }
    
    //MARK: - Setup Root View Controllers
    private func setupRootVC(vc: UIViewController) -> UINavigationController{
        return UINavigationController(rootViewController: vc)
    }
    
}
