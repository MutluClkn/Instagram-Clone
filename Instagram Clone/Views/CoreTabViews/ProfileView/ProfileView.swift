//
//  ProfileView.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 10.01.2023.
//

//MARK: - Frameworks
import UIKit
import SnapKit

//MARK: - ProfileView
class ProfileView: BaseViewController {
    
    
    //-----------------------------
    //MARK: - Properties
    //-----------------------------
    
    private lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        view.delaysContentTouches = false
        view.isExclusiveTouch = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    /*
    private lazy var contentViewForCollection : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    */
    lazy var profilePhoto : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = ProfileViewConstants.cornerRadius
        return image
    }()
    
    lazy var username : UILabel = {
        let label = UILabel()
        label.tintColor = .label
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    lazy var profileDescription : UILabel = {
        let label = UILabel()
        label.tintColor = .label
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var postsText : UILabel = {
        let label = UILabel()
        label.tintColor = .label
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.text = "Posts"
        return label
    }()
    
    lazy var postsCount : UILabel = {
        let label = UILabel()
        label.tintColor = .label
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followersText : UILabel = {
        let label = UILabel()
        label.tintColor = .label
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.text = "Followers"
        return label
    }()
    
    lazy var followersCount : UILabel = {
        let label = UILabel()
        label.tintColor = .label
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followingText : UILabel = {
        let label = UILabel()
        label.tintColor = .label
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.text = "Following"
        return label
    }()
    
    lazy var followingCount : UILabel = {
        let label = UILabel()
        label.tintColor = .label
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var postStackView : UIStackView = {
       let view = UIStackView(arrangedSubviews: [postsCount, postsText])
        view.axis = .vertical
        view.distribution = .equalCentering
        view.alignment = .center
        view.spacing = 5
        return view
    }()
    
    private lazy var followerStackView : UIStackView = {
       let view = UIStackView(arrangedSubviews: [followersCount, followersText])
        view.axis = .vertical
        view.distribution = .equalCentering
        view.alignment = .center
        view.spacing = 5
        return view
    }()
    
    private lazy var followingStackView : UIStackView = {
       let view = UIStackView(arrangedSubviews: [followingCount, followingText])
        view.axis = .vertical
        view.distribution = .equalCentering
        view.alignment = .center
        view.spacing = 5
        return view
    }()
    
    private lazy var profileCondition : UIStackView = {
       let view = UIStackView(arrangedSubviews: [postStackView, followerStackView, followingStackView])
        view.axis = .horizontal
        view.distribution = .equalCentering
        view.alignment = .center
        view.spacing = 15
        return view
    }()
    
    lazy var profileCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identifier)
        return view
    }()

    
    
    //-----------------------------
    //MARK: - Lifecycle
    //-----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        contentView.backgroundColor = .systemBackground
        
        //Constraints
        setupConstraints()


    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        scrollView.isScrollEnabled = true
    }
    
    //-----------------------------
    //MARK: - setupConstraints
    //-----------------------------
    
    private func setupConstraints(){
        //addSubviews
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(profilePhoto)
        contentView.addSubview(username)
        contentView.addSubview(profileDescription)
        contentView.addSubview(profileCondition)
        contentView.addSubview(profileCollectionView)
        
        
        //Scroll View
        scrollView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp_centerXWithinMargins)
            make.width.equalTo(view.snp.width)
            make.top.equalTo(view.snp_topMargin)
            make.bottom.equalTo(view.snp_bottomMargin)
        }
        
        //Content View
        contentView.snp.makeConstraints { make in
            make.centerX.equalTo(scrollView.snp_centerXWithinMargins)
            make.width.equalTo(view.snp.width)
            make.top.equalTo(scrollView.snp_topMargin)
            make.bottom.equalTo(scrollView.snp_bottomMargin)
        }
        
        //Profile Photo
        profilePhoto.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp_topMargin).offset(20)
            make.left.equalTo(contentView.snp_leftMargin).offset(10)
            make.height.equalTo(ProfileViewConstants.profilePhotoHeightWidth)
            make.width.equalTo(ProfileViewConstants.profilePhotoHeightWidth)
        }
        
        //Username
        username.snp.makeConstraints { make in
            make.top.equalTo(profilePhoto.snp_bottomMargin).offset(25)
            make.left.equalTo(contentView.snp_leftMargin).offset(10)
            make.right.equalTo(contentView.snp_rightMargin).offset(-30)
        }
        
        //Description
        profileDescription.snp.makeConstraints { make in
            make.top.equalTo(username.snp_bottomMargin).offset(10)
            make.left.equalTo(contentView.snp_leftMargin).offset(10)
            make.right.equalTo(contentView.snp_rightMargin).offset(-30)
        }
        
        //StackView
        profileCondition.snp.makeConstraints { make in
            make.centerY.equalTo(profilePhoto.snp_centerYWithinMargins)
            make.right.equalTo(contentView.snp_rightMargin).offset(-10)
        }
        
        
        //Collection View
        profileCollectionView.snp.makeConstraints { make in
            make.top.equalTo(profileDescription.snp_bottomMargin).offset(30)
            make.left.equalTo(contentView.snp_leftMargin)
            make.right.equalTo(contentView.snp_rightMargin)
            make.bottom.equalTo(contentView.snp_bottomMargin)
        }
        
    }

}
