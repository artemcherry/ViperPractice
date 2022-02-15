//
//  MainPictureListInteractor.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 14.02.2022.
//

import Foundation

protocol MainPictureListInteractorProtocol: AnyObject {
    func createPictureList(competion: @escaping ([PictureModel]?, Error?) -> Void)
}


class MainPictureListInteractor: MainPictureListInteractorProtocol {
    
    private let networkManager = NetworkManager()
    
    func createPictureList(competion: @escaping ([PictureModel]?, Error?) -> Void) {
        networkManager.getData { networkPicture, error in
            if let networkPicture = networkPicture {
               let convertedModel = self.converterFromNetwork(model: networkPicture)
                DispatchQueue.main.async {
                    competion(convertedModel, nil)
                }
            } else {
                DispatchQueue.main.async {
                    competion(nil, error)
                }
            }
        }
    }
    
        
    private func converterFromNetwork(model: [NetworkPictureModel]) -> [PictureModel] {
        
        return model.map {
            PictureModel(image: $0.thumbnailUrl,
                         name: $0.title)
        }
    }
    
}

