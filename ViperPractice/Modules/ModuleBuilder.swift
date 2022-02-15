//
//  ModuleBuilder.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 15.02.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createPictureListModule(router: RouterProtocol) -> UIViewController?
    func createPictureDescriptionModule(router: RouterProtocol) -> UIViewController?
    
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createPictureListModule(router: RouterProtocol) -> UIViewController? {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let pictureListViewController = mainStoryboard.instantiateViewController(withIdentifier: "PictureList") as? MainPictureListView else { return nil }
//        let presenter = MainPictureListPresenter(view: pictureListViewController, router: router, interactor: )
        return nil
    }
    
    func createPictureDescriptionModule(router: RouterProtocol) -> UIViewController? {
        return nil
    }
    
    
}
