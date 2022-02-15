//
//  MainPictureListPresenter.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 14.02.2022.
//

import Foundation

protocol MainPictureListPresenterProtocol: AnyObject {
    func getPictureList()
}

class MainPictureListPresenter: MainPictureListPresenterProtocol {
    
    private let router: RouterProtocol
    private let interactor: MainPictureListInteractorProtocol
    private let view: MainPictureListViewProtocol
    
    
    required init(view: MainPictureListViewProtocol,
         router: RouterProtocol,
         interactor: MainPictureListInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getPictureList() {
        interactor.createPictureList { pictures, error in
            if let pictures = pictures {
                print(pictures)
            } else {
                print("Ошибка")
            }
        }
    }
}
 
