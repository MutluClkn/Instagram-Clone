//
//  NotificationsViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 4.01.2023.
//

//MARK: - Frameworks
import UIKit

//MARK: - NotificationsViewController
class NotificationsViewController: NotificationsView {

    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        //TableView
        tableView.dataSource = self
    }
    

}

//-----------------------------
//MARK: - UITableViewDataSource
//-----------------------------

extension NotificationsViewController: UITableViewDataSource{
    
    //Number of Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    //Cell For Row At
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationsCell.identifier, for: indexPath) as? NotificationsCell else { return UITableViewCell() }
        
        cell.username.text = "Title"
        cell.overview.text = "Description"
        cell.image.image = UIImage(systemName: "person")
        
        return cell
    }
}
