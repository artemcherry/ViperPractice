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
        
        AF.request(url).responseData { response in
            if let data = response.data {
                guard let decodedData = try? JSONDecoder().decode([NetworkPictureModel].self, from: data) else { return }
                DispatchQueue.main.async {
                    completion(decodedData, nil)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, response.error)
                }
            }
        }
    }
}
