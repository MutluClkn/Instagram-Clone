//
//  ExploreView.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 11.01.2023.
//

//MARK: - Frameworks
import UIKit

//MARK: - ExploreView
class ExploreView: UIViewController {
    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    private lazy var searchBar : UISearchBar = {
        let search = UISearchBar()
        search.backgroundColor = .secondarySystemBackground
        return search
    }()
    
    lazy var exploreCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ExploreCell.self, forCellWithReuseIdentifier: ExploreCell.identifier)
        return view
    }()

    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        //Searchbar
        navigationController?.navigationBar.topItem?.titleView = searchBar
        
        //Collection View
        view.addSubview(exploreCollectionView)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        exploreCollectionView.frame = view.bounds
    }
    
}
