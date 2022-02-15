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
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self.networkManager.getData { networkPicture, error in
                if let networkPicture = networkPicture {
                    let convertedModel = self.converterFromNetwork(model: networkPicture)
                    let filteredModel = convertedModel.filter { $0.albumId  == 1 }
                    DispatchQueue.main.async {
                        competion(filteredModel, nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        competion(nil, error)
                    }
                }
            }
        }
    }
    
        
    private func converterFromNetwork(model: [NetworkPictureModel]) -> [PictureModel] {
        return model.map {
            PictureModel(albumId: $0.albumId,
                         image: $0.thumbnailUrl,
                         name: $0.title)
        }
    }
    
}

