//
//  LikesRouter.swift
//  PhotoGallery
//
//  Created by Георгий on 01.08.2022.
//

import UIKit

protocol LikesRouterProtocol {
    func goToDetailsScreen(for photo: UnsplashPhoto)
}

final class LikesRouter: BaseRouter, LikesRouterProtocol {
    func goToDetailsScreen(for photo: UnsplashPhoto) {
        guard let detailVC = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        detailVC.viewModel = DetailViewModel(selectedPhoto: photo)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
