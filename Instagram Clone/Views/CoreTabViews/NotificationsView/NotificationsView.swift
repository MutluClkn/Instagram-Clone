//
//  NotificationsView.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 10.01.2023.
//

//MARK: - Frameworks
import UIKit

//MARK: - NotificationsView
class NotificationsView: BaseViewController {
    
    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    lazy var tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(NotificationsCell.self, forCellReuseIdentifier: NotificationsCell.identifier)
        return table
    }()
    
    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        //TableView
        view.addSubview(tableView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}
