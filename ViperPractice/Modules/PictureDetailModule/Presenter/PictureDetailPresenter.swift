//
//  PictureDetailPresenter.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 15.02.2022.
//

import Foundation

protocol PictureDetailPresenterProtocol: AnyObject {
    func getPictures()
    
}

class PictureDetailPresenter: PictureDetailPresenterProtocol {
    
    private let view: PictureDetailViewProtocol?
    private let router: RouterProtocol?
    private let picture: PictureModel?
    
    init(view: PictureDetailViewProtocol, router: RouterProtocol, picture: PictureModel) {
        self.view = view
        self.router = router
        self.picture = picture
    }
    
    func getPictures() {
        guard let picture = picture else { return }
        view?.setupView(model: picture)
    }
    
}
