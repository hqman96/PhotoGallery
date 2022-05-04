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
            photosVC, ViewController()
            
            
        ]
    }
}
