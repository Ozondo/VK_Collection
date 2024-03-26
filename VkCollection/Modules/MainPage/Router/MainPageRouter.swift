//
//  MainPageRouter.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit

protocol MainPageRouter {
    func openService(serviceName: String)
}

final class MainPageRouterImpl: MainPageRouter {
    
    weak var sceneController: UIViewController?
    
    func openService(serviceName: String) {
        guard let url = URL(string: serviceName) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
