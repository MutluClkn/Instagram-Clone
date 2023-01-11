//
//  HomeView.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 11.01.2023.
//
//MARK: - Frameworks
import UIKit

//MARK: - HomeView
class HomeView: UIViewController {
    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    lazy var homeFeedTableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(HomeFeedCell.self, forCellReuseIdentifier: HomeFeedCell.identifier)
        return tableView
    }()
    
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Table View
        view.addSubview(homeFeedTableView)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTableView.frame = view.bounds
    }
    

}
