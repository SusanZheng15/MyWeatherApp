//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Susan Zheng on 6/7/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getRequest<T>(urlString: String, completion: @escaping (APIResult<T>) -> Void) {
        guard let url = URL(string: urlString) else{
            completion(.badUrl)
            return
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async() {
                if let error = error{
                    if let response = response as? HTTPURLResponse{
                        switch response.statusCode{
                        case 200...299: break
                        case 404: completion(.notFound)
                        case 400...499: completion(.clientError)
                        case 500...599: completion(.serverError)
                        default:
                            completion(.other(rawError: error))
                        }
                    } else {
                        completion(.other(rawError: error))
                    }
                } else{
                    if let response = response as? HTTPURLResponse{
                        switch response.statusCode{
                        case 200...299:
                            if let data = data{
                                if let result = try? JSONDecoder().decode(T.self, from: data){
                                    completion(.success(result))
                                } else {
                                    completion(.couldNotParseJSONData)
                                }
                            } else {
                                completion(.couldNotParseJSONData)
                            }
                        case 404: completion(.notFound)
                        case 400...499: completion(.clientError)
                        case 500...599: completion(.serverError)
                        default:
                            print("http error occurred, could not manage")
                        }
                    }
                }
            }
            }.resume()
    }
}
