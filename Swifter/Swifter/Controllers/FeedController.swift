//
//  FeedController.swift
//  Swifter
//
//  Created by Santos, Dario Ferreira on 07/02/2023.
//

import UIKit
import SDWebImage

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    var user: User? {
        didSet {
            print("DEBUG: Did set user in feed controller")
            configureLeftBarButton()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "swift-tranparentBackground"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    func configureLeftBarButton() {
        guard let user = user else { return }

        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .swiftOrange
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 16
        profileImageView.layer.masksToBounds = true
        
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
}
