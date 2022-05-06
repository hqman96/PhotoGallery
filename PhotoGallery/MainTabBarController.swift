//
//  MainTabBarController.swift
//  PhotoGallery
//
//  Created by Георгий on 04.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let photosVC = PhotosCollectionViewController (collectionViewLayout: UICollectionViewFlowLayout())
        
        viewControllers = [
            generateNavigationController(rootViewController: photosVC, title: "Gallery", image: #imageLiteral(resourceName: "icons")), generateNavigationController(rootViewController: LikesViewController(), title: "My Collection", image: #imageLiteral(resourceName: "heart"))
            
            
        ]
    }
    
    func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
