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

protocol RouterProtocol {
    func openDetailScreen()
}
 
class Router: RouterProtocol {
    
    private let assemblyBuilder: AssemblyBuilderProtocol?
    
    init(assemblyBuilder: AssemblyBuilderProtocol) {
        self.assemblyBuilder = assemblyBuilder
    }
    
    func openDetailScreen() {
        
    }
}
