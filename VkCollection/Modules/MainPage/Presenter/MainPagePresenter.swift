//
//  MainPagePresenter.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit

final class MainPagePresenter: MainPageOutput {
    
    
    weak var view: MainPageInput?
    private let service: MainPageService
    
    init(service: MainPageService) {
        self.service = service
    }
    func viewDidLoad() {
        view?.title = "Сервисы"
    
        service.getService(completion: { [weak self] result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.view?.setServicies(servicies: success.body.services)
                }
                
            case .failure(let error):
                print(error)
            }
        })
    }
}
