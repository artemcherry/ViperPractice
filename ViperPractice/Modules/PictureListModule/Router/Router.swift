//
//  MainPictureListRouter.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 14.02.2022.
//

import Foundation
import UIKit

protocol RouterMain {
    var assemblyBuilder: AssemblyBuilderProtocol? { get }
}

protocol RouterProtocol: RouterMain {
    func openDetailScreen(picture: PictureModel)
}
 
class Router: RouterProtocol {
    
    var assemblyBuilder: AssemblyBuilderProtocol?
    private let navController: UINavigationController?
    
    init(assemblyBuilder: AssemblyBuilderProtocol, navController: UINavigationController) {
        self.assemblyBuilder = assemblyBuilder
        self.navController = navController
        
    }
    
    func openDetailScreen(picture: PictureModel) {
        guard let descriptionVC = assemblyBuilder?.createPictureDescriptionModule(router: self, picture: picture) else { return }
        navController?.pushViewController(descriptionVC, animated: true)
    }
}
