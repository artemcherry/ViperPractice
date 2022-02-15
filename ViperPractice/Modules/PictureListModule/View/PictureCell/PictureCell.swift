//
//  PictureCell.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 14.02.2022.
//

import UIKit

class PictureCell: UITableViewCell {

    @IBOutlet private weak var picture: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    let idebtifier = "cell"
    
    func setupCell(model: PictureModel) {
        picture.load(url: model.smallImage)
        nameLabel.text = model.name
    }
    
    
}
