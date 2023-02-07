//
//  FeedController.swift
//  Swifter
//
//  Created by Santos, Dario Ferreira on 07/02/2023.
//

import UIKit

class FeedController: UIViewController {
    
    // MARK: - Properties
    
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
}
