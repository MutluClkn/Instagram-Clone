//
//  HomeViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//

//MARK: - Frameworks
import UIKit
import FirebaseAuth

//MARK: - HomeViewController
final class HomeViewController: HomeView {
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        //Methods
        handleNoAuth()
        
        //Table View
        homeFeedTableView.dataSource = self
        homeFeedTableView.delegate = self
    }
    
    
    
    //-----------------------------
    //MARK: - Methods
    //-----------------------------
    
    private func handleNoAuth(){
        if Auth.auth().currentUser == nil {
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
    
}


//-----------------------------
//MARK: - UITableViewDataSource
//-----------------------------

extension HomeViewController: UITableViewDataSource {
    
    //Number Of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //Cell For Row At
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeFeedCell.identifier, for: indexPath) as? HomeFeedCell else { return UITableViewCell() }
        
        cell.username.text = "Test"
        
        return cell
    }
}


//-----------------------------
//MARK: - UITableViewDataSource
//-----------------------------

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

