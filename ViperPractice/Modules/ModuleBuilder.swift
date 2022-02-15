//
//  ModuleBuilder.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 15.02.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createPictureListModule(router: RouterProtocol) -> UIViewController?
    func createPictureDescriptionModule(router: RouterProtocol, picture: PictureModel) -> UIViewController?
    
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createPictureListModule(router: RouterProtocol) -> UIViewController? {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let pictureListViewController = mainStoryboard.instantiateViewController(withIdentifier: "PictureList") as? MainPictureListView else { return nil }
        let interactor = MainPictureListInteractor()
        let presenter = MainPictureListPresenter(view: pictureListViewController, router: router, interactor: interactor )
        pictureListViewController.presenter = presenter
        return pictureListViewController
    }
    
    func createPictureDescriptionModule(router: RouterProtocol, picture: PictureModel) -> UIViewController? {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let descriptionVC = mainStoryboard.instantiateViewController(withIdentifier: "DescriptionVC") as? PictureDetailView else { return nil }
        let presenter = PictureDetailPresenter(view: descriptionVC, router: router, picture: picture)
        descriptionVC.presenter = presenter
        return descriptionVC
    }
    
    
}
