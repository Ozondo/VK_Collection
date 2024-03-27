//
//  MainPagePresenter.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import Foundation

final class MainPagePresenter: MainPageOutput {
    
    weak var view: MainPageInput?
    private let service: MainPageService
    private let router: MainPageRouter
    private var servicesData: [MainPageServiceModel] = []
    
    init(service: MainPageService, router: MainPageRouter) {
        self.service = service
        self.router = router
    }
    
    func viewDidLoad() {
        view?.title = "Сервисы"
    
        service.getService { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                self.servicesData = data.services
                DispatchQueue.main.async {
                    self.view?.setServices(services: data.services)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func routeToService(index: Int) {
        guard index < servicesData.count else { return }
        
        router.openLink(servicesData[index].link)
    }
}
