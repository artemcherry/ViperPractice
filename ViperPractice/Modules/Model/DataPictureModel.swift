//
//  DataPictureModel.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 15.02.2022.
//

import Foundation
import RealmSwift

class DataPictureModel: Object {
    @Persisted var albumId: Int?
    @Persisted dynamic var id: Int?
    @Persisted var title: String?
    @Persisted var url: String?
    @Persisted var thumbnailUrl: String?
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(albumId: Int,
                     id: Int,
                     title: String,
                     url: String,
                     thumbnailUrl: String) {
        self.init()
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
}
