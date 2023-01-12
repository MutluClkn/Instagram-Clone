//
//  MenuViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 9.01.2023.
//

// MARK: - Frameworks
import UIKit

// MARK: - MenuViewController
final class MenuViewController: BaseViewController {
    
    
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
    
    //Selected Menu Index
    var indexSelectedCallback: ((String) -> ())?
    
    
    
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
    
    //Update Menu Model
    private func updateMenuModel(){
        self.menuModel.append(contentsOf: [
            MenuModel(label: "Settings", imageName: "gearshape"),
            MenuModel(label: "Edit Profile", imageName: "person.text.rectangle"),
            MenuModel(label: "Saved", imageName: "bookmark")
        ])
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
        
        let index = self.menuModel[indexPath.row].label
        indexSelectedCallback?(index)
        self.dismiss(animated: true, completion: nil)
        
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
