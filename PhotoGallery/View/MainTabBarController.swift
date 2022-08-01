//
//  MainTabBarController.swift
//  PhotoGallery
//
//  Created by Георгий on 04.05.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        photosVC.viewModel = PhotosCollectionViewModel()
        photosVC.router = PhotosCollectionRouter(viewController: photosVC)
        
        let likesVC = LikesTableViewController()
        likesVC.viewModel = LikesViewModel()
        likesVC.router = LikesRouter(viewController: likesVC)
        
        viewControllers = [
            generateNavigationController(rootViewController: photosVC, title: "Gallery", image: #imageLiteral(resourceName: "icons")), generateNavigationController(rootViewController: likesVC, title: "My Collection", image: #imageLiteral(resourceName: "heart"))
        ]
    }
    
    func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
