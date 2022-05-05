//
//  DetailViewController.swift
//  PhotoGallery
//
//  Created by Георгий on 05.05.2022.
//

import UIKit

class DetailViewController: UIViewController {
    let identifier = "DetailViewController"
    var selectedPhoto: UnsplashPhoto!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var authorsNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var downloadsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}
