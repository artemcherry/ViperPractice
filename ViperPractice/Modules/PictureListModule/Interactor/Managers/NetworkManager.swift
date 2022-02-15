//
//  NetworkManager.swift
//  ViperPractice
//
//  Created by Артем Вишняков on 15.02.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    
    let url = "https://jsonplaceholder.typicode.com/photos"
    
    func getData(completion: @escaping ([NetworkPictureModel]?, Error?) -> Void) {
        guard let url = URL(string: url) else { return }
        
        AF.session.dataTask(with: url) { data, response, error in
            if let data = data {
                let json = try? JSONDecoder().decode([NetworkPictureModel].self, from: data)
                DispatchQueue.main.async {
                    completion(json, nil)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
}
