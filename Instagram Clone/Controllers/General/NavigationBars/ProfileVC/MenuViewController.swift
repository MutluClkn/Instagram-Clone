//
//  MenuViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 9.01.2023.
//

// MARK: - Frameworks
import UIKit

// MARK: - MenuViewController
final class MenuViewController: UIViewController {
    
    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    //Table View
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
        return tableView
    }()
    
    //Menu Model
    var menuModel = [MenuModel]()

    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        //Sheet Presentation Controller
        sheetPresentationControllerConfiguration()
        
        //TableView
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        //MenuModel
        updateMenuModel()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    //-----------------------------
    //MARK: - Methods
    //-----------------------------
    
    private func updateMenuModel(){
        let settings = [MenuModel(label: "Settings", imageName: "gearshape"),
                        MenuModel(label: "Saved", imageName: "bookmark"),
                        MenuModel(label: "Sign Out", imageName: "power")
                        ]
        self.menuModel = settings
    }

}

//-----------------------------
//MARK: - SheetPresentationControllerDelegate
//-----------------------------

extension MenuViewController: UISheetPresentationControllerDelegate {
    
    //Cast PresentationController as Sheet Presentation Controller
    override var sheetPresentationController: UISheetPresentationController?{
        presentationController as? UISheetPresentationController
    }
    
    //Sheet Presentation Controller Configuration
    private func sheetPresentationControllerConfiguration(){
        sheetPresentationController?.delegate = self
        sheetPresentationController?.selectedDetentIdentifier = .medium
        sheetPresentationController?.prefersGrabberVisible = true
        sheetPresentationController?.detents = [
            .medium()
        ]
    }
    
}

//-----------------------------
//MARK: - TableViewDataSource
//-----------------------------

extension MenuViewController: UITableViewDataSource {
    
    //Number of Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuModel.count
    }
    
    //Cell For Row At
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else { return UITableViewCell() }
        
        cell.image.image = self.menuModel[indexPath.row].setImage
        cell.label.text = self.menuModel[indexPath.row].label
        
        return cell
    }
    
    //Did Select Row At
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            //let vc = SettingsViewController()
            //self.navigationController?.pushViewController(vc, animated: true)
            //self.dismiss(animated: true)
            
        }
        else if indexPath.row == 1 {
            //let vc = SavedViewController()
            //self.navigationController?.pushViewController(vc, animated: true)
           // self.dismiss(animated: true)
        }
        else if indexPath.row == 2 {
            AuthManager.shared.signOut()
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
    
}

//-----------------------------
//MARK: - UITableViewDelegate
//-----------------------------

extension MenuViewController: UITableViewDelegate {
    
    //Height For Row at
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewConstants.MenuVC.heightForRowAt
    }
    
}
