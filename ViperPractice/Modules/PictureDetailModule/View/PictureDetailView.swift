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

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    var presenter: PictureDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getPictures()
    }

    func setupView(model: PictureModel) {
        imageView.load(url: model.originalImage ?? "")
        nameLabel.text = model.name
    }

}
