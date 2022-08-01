//
//  BaseRouter.swift
//  PhotoGallery
//
//  Created by Георгий on 01.08.2022.
//

import UIKit

class BaseRouter: NSObject {
    weak var viewController: UIViewController?

    public init(viewController: UIViewController) {
        self.viewController = viewController
        super.init()
    }
}
