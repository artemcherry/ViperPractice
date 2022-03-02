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
    private let realmManager = RealmManager()
    
    func createPictureList(competion: @escaping ([PictureModel]?, Error?) -> Void) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self.networkManager.getData { [weak self] networkPicture, error in
                guard let self = self,
                      error == nil
                else { return }
                if let networkPicture = networkPicture {
                    let convertedModel = self.converterFromNetwork(model: networkPicture)
                    let filteredModel = convertedModel.filter { $0.albumId  == 1 }
                    let pictureToSave = self.convertToData(model: filteredModel)
                    self.realmManager.saveObjects(model: pictureToSave)
                    DispatchQueue.main.async {
                        competion(filteredModel, nil)
                    }
                } else {
                    let savedData = self.realmManager.realmLoadPictures()
                    let convertedData = self.convertFromData(model: savedData)
                    DispatchQueue.main.async {
                        competion(convertedData, nil)
                    }
                }
            }
        }
    }
    
        
    private func converterFromNetwork(model: [NetworkPictureModel]) -> [PictureModel] {
        return model.map {
            PictureModel(albumId: $0.albumId,
                         id: $0.id,
                         smallImage: $0.thumbnailUrl,
                         name: $0.title,
                         originalImage: $0.url)
        }
    }
    
    private func convertToData(model: [PictureModel]) -> [DataPictureModel] {
        return model.map {
            DataPictureModel(albumId: $0.albumId ?? 0,
                                            id: $0.id ?? 0,
                                            title: $0.name ?? "",
                                            url: $0.originalImage ?? "",
                                            thumbnailUrl: $0.smallImage ?? "")
        }
    }
    
    private func convertFromData(model: [DataPictureModel]) -> [PictureModel] {
        return model.map {
            PictureModel(albumId: $0.albumId ?? 0 ,
                         id: $0.id ?? 0,
                         smallImage: $0.thumbnailUrl ?? "",
                         name: $0.title ?? "",
                         originalImage: $0.url ?? "")
        }
    }
}

