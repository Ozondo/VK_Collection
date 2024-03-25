//
//  MainPageService.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit

enum ApiError: Error{
    case badUrl
    case emptyData
    case wrongData
    case custom(Error)
}

protocol MainPageService {
    func getService(completion: @escaping (Result<MainPageResponse, ApiError>) -> ())
}
final class MainPageServiceImpl: MainPageService {
    
    private enum Constants {
        static let baseUrl = "https://publicstorage.hb.bizmrg.com"
    }
    
    func getService(completion: @escaping (Result<MainPageResponse, ApiError>) -> ()) {
        let urlComponents = URLComponents(string: "\(Constants.baseUrl)/sirius/result.json")

        guard let url = urlComponents?.url else {
            return completion(.failure(.badUrl))
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error {
                return completion(.failure(.custom(error)))
            }
            guard let data else {
                return completion(.failure(.emptyData))
            }
            do {
                let servicies = try JSONDecoder().decode(MainPageResponse.self, from: data)
                completion(.success(servicies))
            } catch {
                return completion(.failure(.custom(error)))
            }
        }
        dataTask.resume()
    }
}
