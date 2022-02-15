//
//  RealmManager.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 15.02.2022.
//

import Foundation
import RealmSwift

class RealmManager {

    private func createRealm() -> Realm {
        var realm: Realm {
            do {
                let realm = try Realm()
                return realm
            } catch {
                let error = NSError()
                print(error)
            }
            return realm
        }
        return realm
    }

    func saveObjects(model: [Object]) {
        let realm = createRealm()
        do {
            try model.forEach { object in
                try realm.write {
                    realm.add(object, update: .modified)
                
                }
            }
        } catch {
            let error = NSError()
            print(error)
        }
    }
    
    func realmLoadPictures() -> [DataPictureModel] {
        let realm = createRealm()
        return Array(realm.objects(DataPictureModel.self))
    }
}
