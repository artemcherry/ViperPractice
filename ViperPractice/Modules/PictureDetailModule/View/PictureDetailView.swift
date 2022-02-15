//
//  PictureDetailView.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 15.02.2022.
//

import UIKit

protocol PictureDetailViewProtocol: AnyObject {
    func setupView(model: PictureModel)
}

class PictureDetailView: UIViewController, PictureDetailViewProtocol {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var presenter: PictureDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getPictures()
    }

    func setupView(model: PictureModel) {
        imageView.load(url: model.originalImage)
        nameLabel.text = model.name
    }

}
