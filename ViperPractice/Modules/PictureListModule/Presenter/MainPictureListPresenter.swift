//
//  MainPictureListPresenter.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 14.02.2022.
//

import Foundation

protocol MainPictureListPresenterProtocol: AnyObject {
    func getPictureList()
    func getDescription(picture: PictureModel)
}

class MainPictureListPresenter: MainPictureListPresenterProtocol {
    
    private let router: RouterProtocol?
    private let interactor: MainPictureListInteractorProtocol?
    private let view: MainPictureListViewProtocol?
    
    
    required init(view: MainPictureListViewProtocol,
         router: RouterProtocol,
         interactor: MainPictureListInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getPictureList() {
        guard let interactor = interactor else { return }
        interactor.createPictureList { [weak self]  pictures, error in
            guard let self = self else { return }
            if let pictures = pictures {
                self.view?.setupModel(model: pictures)
            } else {
                print("Ошибка")
            }
        }
    }
    
    func getDescription(picture: PictureModel) {
        router?.openDetailScreen(picture: picture)
    }
    
}
 
